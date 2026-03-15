// Template Class

#ifndef CONTAINER_H
#define CONTAINER_H

#include <iostream>

namespace LibrarySystem {

template <class T>

class Container {

private:
    T* arr;
    int size;
    int capacity;

public:

    Container(int cap=100){
        capacity=cap;
        size=0;
        arr=new T[capacity];
    }

    ~Container(){
        delete[] arr;
    }

    void add(T item){
        if(size<capacity){
            arr[size++]=item;
        }
    }

    T* find(int id){

        for(int i=0;i<size;i++){
            if(arr[i].getId()==id)
                return &arr[i];
        }
        return nullptr;
    }

    void display(){

        for(int i=0;i<size;i++)
            std::cout<<arr[i]<<std::endl;
    }
};

}

#endif
