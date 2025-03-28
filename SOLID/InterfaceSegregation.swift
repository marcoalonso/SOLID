//
//  InterfaceSegregation.swift
//  SOLID
//
//  Created by Marco Alonso Rodriguez on 28/03/25.
//

import Foundation
/*
 🪓 I – Interface Segregation Principle (Segregación de Interfaces)
 🧠 ¿Qué significa?
 No fuerces a una clase a implementar métodos que no necesita.

 🧍‍♂️ Analogía:
 No todos los empleados necesitan saber usar la caja registradora. No obligues a todos a aprenderlo solo porque están en el mismo contrato.

 💻 En código:
 Divide protocolos grandes en protocolos más pequeños, específicos, para que las clases implementen solo lo que usan.
 */

protocol Saveable {
    func save(_ task: Task)
}

protocol Deletable {
    func delete(_ task: Task)
}

protocol Syncable {
    func syncToCloud()
}

class CustomTask: Saveable, Deletable {
    func save(_ task: Task) {
        print("Saving task...")
    }
    
    func delete(_ task: Task) {
        print( "Deleting task...")
    }
}

class CloudTaskSyncer: Syncable {
    func syncToCloud() {
        print("Syncing tasks to cloud...")
    }
}
