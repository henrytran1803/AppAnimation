//
//  DragAndDropView.swift
//  AppAnimation
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import SwiftUI
import Algorithms
import UniformTypeIdentifiers
struct DragAndDropView: View {
    @State private var toDoTasks: [DeveloperTasks] = [MockData.taskOne, MockData.taskTwo, MockData.taskThree]
    @State private var inProgressTasks: [DeveloperTasks] = []
    @State private var doneTasks: [DeveloperTasks] = []

    @State private var isInProgressTarget = false
    @State private var isToDpTarget = false
    @State private var isDoneTarget = false
    var body: some View {
        HStack(spacing: 12) {
            KanbanView(title: "To Do", tasks: toDoTasks, isTargeted: isToDpTarget)
                .dropDestination(for: DeveloperTasks.self){
                    dropTasks, location in
                    for task in dropTasks {
                        inProgressTasks.removeAll{$0.id == task.id}
                        doneTasks.removeAll{$0.id == task.id}
                    }
                    
                    let totalTasks = toDoTasks + dropTasks
                    toDoTasks = Array(totalTasks.uniqued())
                    return true
                }isTargeted: { isTargeted in
                    isToDpTarget = isTargeted
                }
            KanbanView(title: "In Progress", tasks: inProgressTasks, isTargeted: isInProgressTarget)
                .dropDestination(for: DeveloperTasks.self){
                    dropTasks, location in
                    for task in dropTasks {
                        toDoTasks.removeAll{$0.id == task.id}
                        doneTasks.removeAll{$0.id == task.id}
                    }
                    
                    let totalTasks = inProgressTasks + dropTasks
                    inProgressTasks = Array(totalTasks.uniqued())
                    return true
                }isTargeted: { isTargeted in
                    isInProgressTarget = isTargeted
                }
            KanbanView(title: "Done", tasks: doneTasks, isTargeted: isDoneTarget)
                .dropDestination(for: DeveloperTasks.self){
                    dropTasks, location in
                    for task in dropTasks {
                        toDoTasks.removeAll{$0.id == task.id}
                        inProgressTasks.removeAll{$0.id == task.id}
                    }
                    
                    let totalTasks = doneTasks + dropTasks
                    doneTasks = Array(totalTasks.uniqued())
                    return true
                }isTargeted: { isTargeted in
                    isDoneTarget = isTargeted
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

#Preview {
    DragAndDropView()
}
struct KanbanView: View {

    let title: String
    let tasks: [DeveloperTasks]
    let isTargeted: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.footnote.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(isTargeted ? .teal.opacity(0.15) :Color(.secondarySystemFill))

                VStack(alignment: .leading, spacing: 12) {
                    ForEach(tasks, id: \.id) { task in // từng task trong task2 thì tạo ra 1 thẻ
                        Text(task.title)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .draggable(task)
                            
                    }

                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}
struct DeveloperTasks: Codable,Hashable, Transferable {
    let id: UUID
    let title: String
    let owner: String
    let note: String
    static var transferRepresentation: some TransferRepresentation{
        CodableRepresentation(contentType: .developerTask)
    }
}

extension UTType{
    static let developerTask = UTType(exportedAs: "co.henrytran.developerTask")
}
struct MockData{
    static let taskOne =  DeveloperTasks(id: UUID(), title: "Title1", owner: "None", note: "None")
    static let taskTwo =  DeveloperTasks(id: UUID(), title: "Title2", owner: "None", note: "None")
    static let taskThree =  DeveloperTasks(id: UUID(), title: "Title3", owner: "None", note: "None")
}
