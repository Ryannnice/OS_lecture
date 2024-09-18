#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define Frame_Size 4
#define Input_Size 20

// 初始输入数据：
int Input[20] = {7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0, 1} ;

// 链表节点结构体定义：
typedef struct Double_Linked_Node{
    int data ;
    struct Double_Linked_Node* next ;
    struct Double_Linked_Node* prev ;
}Node ;

Node* head = NULL ; // 链表头指针
Node* tail = NULL ; // 链表尾指针
int size = 0 ;      // 链表长度

// 函数声明：
// 链表操作函数：
void insertFront(int ) ;
void moveToHead(Node* ) ;
void printList() ;
bool existList(int ) ;

// 页面置换算法：
void LeastRecentlyUsedList() ;
// 统计缺页异常发生的次数
int LRU_Fault = 0 ;

// 函数实现：
// 在链表头插入新节点：
void insertFront(int num )
{
    Node* new = (Node* )malloc(sizeof(Node ) ) ;
    new->data = num ;
    new->next = head ;
    new->prev = NULL ;

    if(head != NULL ){
        head->prev = new ;
    }else{
        tail = new ; // 如果链表为空，新节点同时也是尾节点
    }

    head = new ;
    size++ ;
}

// 将节点移动到链表头部：
void moveToHead(Node* node )
{
    if(node == head ){
        // 已经在头部，无需移动
        return ;
    }

    if(node == tail ){
        // 更新尾节点指针
        tail = node->prev ;
        tail->next = NULL ;
    }else{
        // 更新相邻节点的指针
        node->next->prev = node->prev ;
        node->prev->next = node->next ;
    }

    // 将节点插入到头部
    node->next = head ;
    node->prev = NULL ;
    head->prev = node ;
    head = node ;
}

// 遍历输出链表信息：
void printList()
{
    Node* temp = head ;
    printf("\nFrame Now:\n" ) ;
    if(size == 0 ){
        printf("Empty !\n" ) ;
    }else{
        while (temp != NULL ){
            printf("%d  ", temp->data ) ;
            temp = temp->next ;
        }
    }
    printf("\n\n" ) ;
}

// 检查页面是否在链表中：
bool existList(int num )
{
    Node* temp = head ;

    if(size == 0 )
        return false ;

    while (temp != NULL ){
        if(temp->data == num ){
            // 页面存在，将其移动到链表头
            moveToHead(temp ) ;
            return true ;
        }
        temp = temp->next ;
    }
    return false ;
}

void LeastRecentlyUsedList()
{
    for (int i = 0 ; i < Input_Size ; i++ ){
        // 页面存在：
        if(existList(Input[i] ) ){
            printf("Page'%d' already in frame.\nPage'%d' moved to head\n", Input[i] , Input[i] ) ;
            printList() ;
            continue ;
        }
        // 缺页异常：
        LRU_Fault ++  ;
        printf("[PAGE FAULT]: Page'%d' not in frame. \n", Input[i] ) ;
        if(size < Frame_Size ){
            // 页框未满，直接插入链表头部：
            insertFront(Input[i] ) ;
            printf("Page '%d' has been moved into frame ! \n", Input[i] ) ;
        }else{
            // 页框满了，进行置换操作，将尾节点出链表，新页面插入头部：
            Node* lastNode = tail ;
            tail = lastNode->prev ;
            if(tail != NULL ){
                tail->next = NULL ;
            }else{
                head = NULL ;
            }
            insertFront(Input[i] ) ;
            printf("Frame full!\nPage '%d' has been moved out from frame ! \n", lastNode->data ) ;
            printf("Page '%d' has been moved into frame ! \n", Input[i] ) ;
            free(lastNode ) ;
        }
        printList() ;
    }

    printf("\nLeast recently used algorithm with double linked list over...\nNumber of page fault is : %d \n\n\n", LRU_Fault ) ;
}

int main()
{
    LeastRecentlyUsedList() ;

    return 0 ;
}
