package service.impl

import service.api.Logger
import javax.inject.Inject

internal class ConsoleLogger @Inject constructor() : Logger {
    override fun log(message: String) {
        doLog("[LOGGER] $message")
    }

   fun log2(message: String) {
        doLog("[LOGGER] $message")
    }

  private fun doLog(message: String) {
    println(message)
  }
}
