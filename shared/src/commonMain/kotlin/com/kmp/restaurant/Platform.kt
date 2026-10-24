package com.kmp.restaurant

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform