#include <stdio.h>
#include <stdlib.h>
#include <time.h>
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
    double e_time_diffs[1001];// = {-1};
    double de_time_diffs[501];// = {-1};
    clock_t start = clock();
    clock_t begin = clock();
    clock_t end = clock();
    e_time_diffs[0] = (double)(start)/CLOCKS_PER_SEC;
    fprintf(fout1,"%f \n",e_time_diffs[0]);
    for(int i=0;i<1000;i++){
        //begin = clock();
        enqueue(&head,&tail,i);
        end = clock();
        e_time_diffs[i+1] = (double)(end)/CLOCKS_PER_SEC;
        printf("ith operation %f \n",e_time_diffs[i+1]);
        fprintf(fout1,"%f \n",e_time_diffs[i+1]);
    }

    start = clock();
    de_time_diffs[0]=(double)(start)/CLOCKS_PER_SEC;
    fprintf(fout2,"%f \n",de_time_diffs[0]);
    for(int i=0;i<500;i++){
        //begin = clock();
        dequeue(&head,&tail);
        end = clock();
        de_time_diffs[i+1] = (double)(end)/CLOCKS_PER_SEC;
        printf("jth operation %f \n",de_time_diffs[i+1]);
        fprintf(fout2,"%f \n",de_time_diffs[i+1]);
    }

    printf("After Dequeue \n");
    while(head!=NULL){
        printf("%d ",head->val);
        head = head->next;
    }

    fclose(fout1);
    fclose(fout2);
    return 0;
    
}