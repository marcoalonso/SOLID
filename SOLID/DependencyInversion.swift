//
//  DependencyInversion.swift
//  SOLID
//
//  Created by Marco Alonso Rodriguez on 28/03/25.
//

/*
 🏗 D – Dependency Inversion Principle (Inversión de Dependencias)
 🧠 ¿Qué significa?
 Depende de abstracciones (protocolos), no de clases concretas.

 🧍‍♂️ Analogía:
 Si tienes un control remoto universal, puedes cambiar de tele sin problema. Si tu control solo sirve para una marca, estás atado.

 💻 En código:
 En lugar de usar directamente EmailService, usas un protocolo NotificationService. Así puedes cambiar la implementación fácilmente (ej: SMSService, PushService, etc.).
 */

import Foundation

protocol NotificationService {
    func notify(_ message: String)
}

class PushNotificationService: NotificationService {
    func notify(_ message: String) {
        print("Push: \(message)")
    }
}

class EmailNotificationService: NotificationService {
    func notify(_ message: String) {
        print("Email: \(message)")
    }
}

class SMSNotificationService: NotificationService {
    func notify(_ message: String) {
        print("SMS: \(message)")
    }
}

class WhatsAppNotificationService: NotificationService {
    func notify(_ message: String) {
        print("WhatsApp: \(message)")
    }
}

class TaskNotifier {
    private let notificationService: NotificationService

    init(service: NotificationService) {
        self.notificationService = service
    }

    func notifyTaskAdded(_ task: Task) {
        notificationService.notify("Tarea agregada: \(task.title)")
    }
}
