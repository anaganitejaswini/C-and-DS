#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>

#define BILLION 1000000000L

// A linked list node

struct Node{
    int val;
    struct Node *next;
};

// Enqueue
void enqueue(struct Node** head,struct Node** tail, int new_val){
    // 1. Create new node - memory allocation, update data
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->val = new_val;
    newNode->next = (*head);

    // 2. Update the head pointer (point it to the newly created node)
    (*head) = newNode;
    if((*tail)==NULL){
        (*tail)=newNode;
    }
    return;
}

// Dequeue
void dequeue(struct Node** head,struct Node** tail){
    if((*tail)==NULL){ //No nodes in the end of the linked list to delete
        return;
    }
    struct Node* todelete = (*tail);
    // 1. Traverse the list to find the second last node;
    struct Node* head2 = (*head);
    while(head2->next->next!=NULL){
        head2 = head2->next;
    }
    head2->next = NULL;
    (*tail)=head2;
    free(todelete);
    return;
}


int main(){

    FILE *fout1,*fout2;
    fout1 = fopen("../data/enqueue.dat","w");
    fout2 = fopen("../data/dequeue.dat","w");
    // Create an empty list
    struct Node* head = NULL;
    struct Node* tail = NULL;
    uint64_t e_time_diffs[1001];// = {-1};
    uint64_t de_time_diffs[501];// = {-1};
    struct timespec start, begin, end;
    clock_gettime(CLOCK_MONOTONIC, &start);
    e_time_diffs[0] = BILLION * (start.tv_sec) + start.tv_nsec;
    fprintf(fout1,"%llu \n", (long long unsigned int)e_time_diffs[0]);
    for(int i=0;i<1000;i++){
        clock_gettime(CLOCK_MONOTONIC, &begin);
        enqueue(&head,&tail,i);
        clock_gettime(CLOCK_MONOTONIC, &end);;
        e_time_diffs[i+1] = BILLION * (end.tv_sec - begin.tv_sec) + end.tv_nsec - begin.tv_nsec;
        //printf("ith operation %llu \n", (long long unsigned int)e_time_diffs[i+1]);
        fprintf(fout1,"%llu \n", (long long unsigned int)e_time_diffs[i+1]);
    }
    clock_gettime(CLOCK_MONOTONIC, &start);
    de_time_diffs[0] = BILLION * (start.tv_sec) + start.tv_nsec;
    fprintf(fout2,"%llu \n",(long long unsigned int)de_time_diffs[0]);
    for(int i=0;i<500;i++){
	    clock_gettime(CLOCK_MONOTONIC, &begin);
        dequeue(&head,&tail);
	    clock_gettime(CLOCK_MONOTONIC, &end);
        de_time_diffs[i+1] = BILLION * (end.tv_sec - begin.tv_sec) + end.tv_nsec - begin.tv_nsec;
        //printf("jth operation %llu \n",(long long unsigned int)de_time_diffs[i+1]);
        fprintf(fout2,"%llu \n",(long long unsigned int)de_time_diffs[i+1]);
    }


    fclose(fout1);
    fclose(fout2);
    return 0;
    
}
