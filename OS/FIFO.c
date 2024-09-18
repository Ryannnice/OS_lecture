#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define Frame_Size 4
#define Input_Size 20

// 初始输入数据：
int Input[20] = {7,0,1,2,0,3,0,4,2,3,0,3,2,1,2,0,1,7,0,1} ;

// 队列节点结构体定义：
typedef struct Queue_Node{
    int data ;
    struct Queue_Node* next ;
} Node ;
Node* head = NULL ;
Node* tail = NULL ;
int size = 0 ; // 队列长度

// 函数声明：
// 队列操作函数：
void enQueue(int) ;
int deQueue() ;
void printQueue() ;
bool existQueue(int) ;

// 页面置换算法：
void FirstInFirstOut() ;
void LastRecentlyUsed() ;
// 统计缺页异常发生的次数
int FIFO_Fault = 0 ;
int LRU_Fault = 0 ;

// 函数实现：
// 新节点放入链表（即队列）尾部：
void enQueue(int num )
{
    // 初始化新节点：
    Node* new = (Node* )malloc(sizeof(Node ) ) ;
    new->data = num ;
    new->next = NULL ;

    // 放入队列：
    if(size == 0 ){ 
        // 无节点时：
        head = new ;
        tail = head ;
        size ++ ;
    }else{ 
        // 新节点进入队列：
        tail->next = new ;
        tail = new ;
        size ++ ;
    }

    // 每次入队，都代FIFO表页框内发生缺页异常：
    FIFO_Fault ++ ;
}

// 取出队头节点：
int deQueue()
{
    int num = head->data ;
    head = head->next ;
    size -- ;

    return num ;
}

// 遍历输出队列信息：
void printQueue()
{
    Node* temp = head ;
    printf("\nFrame Now:\n") ;
    if(size == 0){
        printf("Empty !\n") ;
    }else{
        for(int i = 0 ; i < size ; i++ )
        {
            printf("%d  " , temp->data ) ;

            if(temp != tail )
                temp = temp->next ;
        }      
    }
    printf("\n\n") ;
}

// 检查页面是否在页框中：
bool existQueue(int num )
{
    Node* temp = head ;

    if(size == 0 )
        return false ;
    
    for(int i = 0 ; i < size ; i ++ )
    {
        if(temp->data == num )
            return true ;
        if(temp != tail )
            temp = temp->next ;
    }
    return false ;
}

void FirstInFirstOut()
{
    for(int i = 0 ; i < Input_Size ; i ++ )
    {
        // 页面存在：
        if(existQueue(Input[i]) )
        {
            printf("Page'%d' already in frame.\n\n" , Input[i]) ;
            continue ;
        }
        // 缺页异常：
        printf("[PAGE FAULT]: Page'%d' not in frame. \n" , Input[i]) ;
        if(size < Frame_Size ){ 
            // 页框未满，直接入队：
            enQueue(Input[i] ) ;
            printf("Page '%d' has been moved into frame ! \n" , Input[i] ) ;
        }else{
            // 页框满了，进行置换操作，出队入队：
            int pop = deQueue() ;
            printf("Frame full!\nPage '%d' has been moved out from frame ! \n" , pop ) ;
            enQueue(Input[i] ) ;
            printf("Page '%d' has been moved into frame ! \n" , Input[i] ) ;
        }
        printQueue() ;
    }

    printf("\nFirst in first out algorithm over...\nNumber of page fault is : %d \n\n\n" , FIFO_Fault ) ;
}

int main()
{
    FirstInFirstOut() ;

    return 0;
}
