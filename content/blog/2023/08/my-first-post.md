---
title: "My First Post"
date: 2023-08-10T20:48:59-03:00
draft: false
summary: "The very first post on Hugo"
tags: ["kotlin", "development"]
categories: ["Development", "Kotlin"]
---

# Introduction

This is my first post. My objective is to write some technical articles about software development and practice my writing in english. Also, this post will help me to test and review the Hugo as static site generator.

Below, some snippet code:

```kotlin
fun factorial(n: Int): Int {
    return if (n == 0) {
        1
    } else {
        n * factorial(n - 1)
    }
}
 
fun main() {
    print("Enter an integer : ")
    val num = readLine()!!.toInt()
    val result = factorial(num)
    println("$num! is $result.")
}
```