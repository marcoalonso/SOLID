//
//  OpenClosed.swift
//  SOLID
//
//  Created by Marco Alonso Rodriguez on 28/03/25.
//

import Foundation
/*
 🧬 O – Open/Closed Principle (Abierto/Cerrado)
 🧠 ¿Qué significa?
 El código debe estar abierto para extensión, pero cerrado para modificación.

 🧍‍♂️ Analogía:
 Piensa en un enchufe múltiple. Puedes conectar más dispositivos sin tener que abrirlo o cambiar su estructura. Solo lo extiendes.

 💻 En código:
 Usamos protocolos o herencia para agregar nuevas funcionalidades sin tener que reescribir clases existentes.
 */

protocol TaskStorage {
    func save(_ task: Task)
}

class InMemoryStorage: TaskStorage {
    private var tasks: [Task] = []
    
    func save(_ task: Task) {
        tasks.append(task)
    }
}

class DiskStorage: TaskStorage {
    func save(_ task: Task) {
        print("Saving task to disk: \(task.title)")
    }
}

class TaskService {
    private let storage: TaskStorage

    init(storage: TaskStorage) {
        self.storage = storage
    }

    func addTask(title: String) {
        let task = Task(id: UUID(), title: title, isCompleted: false)
        storage.save(task)
    }
}
