//
//  ModuleAssembler.swift
//  CombineViper
//
//  Created by ALi on 2021. 05. 28..
//

import Swinject

open class ModuleAssembler {
    
    public var resolver: Resolver {
        assembler.resolver
    }
    
    private let assembler: Assembler
    private let assembly: Assembly
    
    public init(with assembly: Assembly) {
        self.assembly = assembly
        assembler = Assembler([assembly], parent: DI.globalAssembler)
    }
    
    public func getResolvedViewController() -> BaseViewController {
        guard let viewController = resolver.resolve(BaseViewController.self) else {
            fatalError("BaseViewController cannot be resolved!")
        }
        
        return viewController
    }
}
