import Foundation

// MARK: - Полный гид по модификаторам PinLayout

/* 🎯 Правильный порядок модификаторов:
 Правильный порядок применения (логический):
 view.pin
     .ПОЗИЦИОНИРОВАНИЕ        // 1. Позиция (edges, anchors, relative)
     .РАЗМЕРЫ                 // 2. Размеры (width, height, size)
     .pinEdges()              // 3. Закрепление краев (если нужно)
     .ОТСТУПЫ                 // 4. Отступы (margins)
     .sizeToFit()             // 5. Подгонка размера (если нужно)
 */
// Пример:
view.pin
    // 1. ANCHORING (Якоря/привязки)
    .top(), .bottom(), .left(), .right()
    .hCenter(), .vCenter(), .center()
    // 2. EDGES (Края)
    .all(), .horizontally(), .vertically()
    // 3. SIZE (Размеры)
    .width(), .height(), .size()
    .minWidth(), .maxWidth(), .minHeight(), .maxHeight()
    .aspectRatio()
    // 4. MARGINS (Отступы)
    .margin(), .marginTop(), .marginBottom()
    .marginLeft(), .marginRight()
    .marginHorizontal(), .marginVertical()
    // 5. FITTING (Подгонка размера)
    .sizeToFit(), .fitSize()


// 🎯 1. ПОЗИЦИОНИРОВАНИЕ (Edges & Anchors)
// Позиционирование относительно superview

// Основные края (Edges):
// Отдельные края
view.pin.top(10)           // Отступ сверху 10px
view.pin.bottom(10)        // Отступ снизу 10px
view.pin.left(10)          // Отступ слева 10px
view.pin.right(10)         // Отступ справа 10px
// Центрирование
view.pin.vCenter()         // Вертикальный центр
view.pin.hCenter()         // Горизонтальный центр
view.pin.center()          // Полное центрирование
// Группировка краев
view.pin.all()             // Все края (заполнить родителя)
view.pin.all(10)           // Все края с отступом 10px
view.pin.horizontally()    // Левый и правый края
view.pin.vertically()      // Верхний и нижний края

// Комбинированные позиции (Anchors)
// Углы
view.pin.topLeft()         // Верхний левый угол
view.pin.topRight()        // Верхний правый угол
view.pin.bottomLeft()      // Нижний левый угол
view.pin.bottomRight()     // Нижний правый угол
// Центрированные позиции
view.pin.topCenter()       // Верх по центру
view.pin.bottomCenter()    // Низ по центру
view.pin.centerLeft()      // Центр слева
view.pin.centerRight()     // Центр справа

//Позиционирование относительно других view

// Относительное позиционирование
// Базовые направления
view.pin.above(of: otherView)    // Выше указанного view
view.pin.below(of: otherView)    // Ниже указанного view
view.pin.left(of: otherView)     // Слева от указанного view
view.pin.right(of: otherView)    // Справа от указанного view
// Множественные view
view.pin.below(of: [view1, view2, view3])  // Ниже всех указанных view

// Относительное позиционирование с выравниванием
// Горизонтальное выравнивание
view.pin.above(of: otherView, aligned: .left)    // Выше и по левому краю
view.pin.below(of: otherView, aligned: .center)  // Ниже и по центру
view.pin.below(of: otherView, aligned: .right)   // Ниже и по правому краю
// Вертикальное выравнивание
view.pin.left(of: otherView, aligned: .top)      // Слева и по верху
view.pin.right(of: otherView, aligned: .center)  // Справа и по центру
view.pin.right(of: otherView, aligned: .bottom)  // Справа и по низу

// Позиционирование между view
// Горизонтальное размещение между двумя view
view.pin.horizontallyBetween(viewA, and: viewB)
view.pin.horizontallyBetween(viewA, and: viewB, aligned: .top)
// Вертикальное размещение между двумя view
view.pin.verticallyBetween(viewA, and: viewB)
view.pin.verticallyBetween(viewA, and: viewB, aligned: .center)

// Позиционирование через края других view
// Привязка к краям других view
view.pin.top(to: otherView.edge.bottom)      // Верх к низу другого view
view.pin.left(to: otherView.edge.right)      // Лево к правому краю другого view
view.pin.hCenter(to: otherView.edge.hCenter) // Центр к центру другого view
