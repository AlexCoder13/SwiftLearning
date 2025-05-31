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

//
