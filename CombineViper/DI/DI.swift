//
//  DI.swift
//  CombineViper
//
//  Created by ALi on 2021. 08. 25..
//

import Foundation
import Swinject

public protocol AssemblerFactoring {
    func create() -> Assembler
}

public final class DI {

    public static private(set) var globalAssembler: Assembler = getGlobalAssembler()
    public static var globalAssemblerFactory: AssemblerFactoring?

    public class func getGlobalAssembler() -> Assembler {
        guard let factory = globalAssemblerFactory else {
            fatalError("Global assembler factory not set!")
        }
        
        return factory.create()
    }
    
    public class func resetGlobalAssembler(with assembler: Assembler) {
        globalAssembler = assembler
    }
    
    public class func reset(objectScope: ObjectScope) {
        (globalAssembler.resolver as? Container)?.resetObjectScope(objectScope)
    }
}
