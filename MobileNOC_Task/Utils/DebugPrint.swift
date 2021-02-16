//
//  DebugPrint.swift
//  MobileNOC_Task
//
//  Created by Jasur Rajabov on 2/11/21.
//

import Foundation

enum DebugPrint {
    #if DEBUG
    static func location(_ items: Any...,
                         separator: String = " ",
                         terminator: String = "\n",
                         filePath: String = #filePath,
                         function: String = #function,
                         lineNumber: Int = #line,
                         column: Int = #column) {
        let fileName = (filePath as NSString).lastPathComponent
        print("""
  \(items)
      \(fileName)
      \(function)
      line: \(lineNumber), col: \(column)
""")
    }
    #endif
}
