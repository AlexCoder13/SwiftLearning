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

// Позиционирование через якоря (Anchors)
// Привязка к якорям других view
view.pin.topLeft(to: otherView.anchor.bottomRight)     // Левый верх к правому низу
view.pin.center(to: otherView.anchor.topLeft)          // Центр к левому верху
view.pin.bottomRight(to: otherView.anchor.topRight)    // Правый низ к правому верху


// 📏 2. РАЗМЕРЫ (Width, Height, Size)

// Абсолютные размеры
// Фиксированные размеры
view.pin.width(100)        // Ширина 100px
view.pin.height(50)        // Высота 50px
view.pin.size(100, 50)     // Ширина 100px, высота 50px
view.pin.size(100)         // Квадрат 100x100px

// Процентные размеры
// Размеры в процентах от родителя
view.pin.width(50%)        // 50% ширины родителя
view.pin.height(25%)       // 25% высоты родителя
view.pin.size(80%)         // 80% от ширины и высоты родителя

// Размеры относительно других view
// Размеры как у других view
view.pin.width(of: otherView)    // Ширина как у другого view
view.pin.height(of: otherView)   // Высота как у другого view
view.pin.size(of: otherView)     // Размер как у другого view

// Ограничения размеров
// Минимальные и максимальные размеры
view.pin.minWidth(50)      // Минимальная ширина 50px
view.pin.maxWidth(200)     // Максимальная ширина 200px
view.pin.minHeight(30)     // Минимальная высота 30px
view.pin.maxHeight(100)    // Максимальная высота 100px
// Проценты тоже работают
view.pin.maxWidth(80%)     // Максимум 80% ширины родителя

//🎨 3. ПОДГОНКА РАЗМЕРА (SizeToFit)
// Автоматическая подгонка размера
// Базовая подгонка размера
view.pin.sizeToFit()       // Размер по содержимому (как UIView.sizeToFit())
// Подгонка по ширине
view.pin.width(200).sizeToFit(.width)          // Высота подгоняется под ширину 200px
view.pin.width(50%).sizeToFit(.width)          // Высота подгоняется под 50% ширины
// Подгонка по высоте
view.pin.height(100).sizeToFit(.height)        // Ширина подгоняется под высоту 100px
// Гибкая подгонка (может быть меньше/больше заданного размера)
view.pin.width(200).sizeToFit(.widthFlexible)  // Ширина может отличаться от 200px
view.pin.height(100).sizeToFit(.heightFlexible) // Высота может отличаться от 100px

// 📐 4. СООТНОШЕНИЕ СТОРОН (AspectRatio)
// Фиксированное соотношение сторон
view.pin.width(100).aspectRatio(1.5)           // Ширина 100px, высота 66.67px (100/1.5)
view.pin.height(100).aspectRatio(2.0)          // Высота 100px, ширина 200px (100*2.0)
// Соотношение сторон другого view
view.pin.width(150).aspectRatio(of: otherView)
// Для UIImageView - соотношение сторон из изображения
imageView.pin.width(200).aspectRatio()         // Высота автоматически из пропорций картинки

// 🔲 5. ЗАКРЕПЛЕНИЕ КРАЕВ (pinEdges)
// pinEdges() закрепляет все четыре края перед применением отступов. Полезно когда заданы width/height:
// Без pinEdges() - отступы сдвинут view
view.pin.left().width(100%).marginHorizontal(20)  // View сдвинется влево

// С pinEdges() - отступы уменьшат размер view
view.pin.left().width(100%).pinEdges().marginHorizontal(20)  // View уменьшится на 40px

// 📏 6. ОТСТУПЫ (Margins)
// Отдельные отступы
// Отдельные стороны
view.pin.marginTop(10)     // Отступ сверху 10px
view.pin.marginLeft(15)    // Отступ слева 15px
view.pin.marginBottom(10)  // Отступ снизу 10px
view.pin.marginRight(15)   // Отступ справа 15px
// Проценты
view.pin.marginTop(5%)     // 5% от высоты родителя
view.pin.marginLeft(10%)   // 10% от ширины родителя

// Групповые отступы
// Все стороны одинаково
view.pin.margin(10)        // 10px со всех сторон
// Вертикальные и горизонтальные
view.pin.marginVertical(10)      // Верх и низ 10px
view.pin.marginHorizontal(15)    // Лево и право 15px
// Комбинированные
view.pin.margin(10, 15)          // Верх/низ 10px, лево/право 15px
view.pin.margin(5, 10, 15)       // Верх 5px, лево/право 10px, низ 15px
view.pin.margin(5, 10, 15, 20)   // Верх 5px, право 10px, низ 15px, лево 20px

// Отступы с UIEdgeInsets
// Использование safeArea
view.pin.all(pin.safeArea)                    // Заполнить safeArea
view.pin.margin(pin.safeArea)                 // Отступы по safeArea
// Кастомные UIEdgeInsets
let insets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
view.pin.margin(insets)

//🎯 7. ВЫРАВНИВАНИЕ (Justify & Align)
//Горизонтальное выравнивание (justify)
//Когда заданы left, right и width - view может быть меньше доступного пространства:
view.pin.left().right().width(100).justify(.left)     // По левому краю
view.pin.left().right().width(100).justify(.center)   // По центру
view.pin.left().right().width(100).justify(.right)    // По правому краю
// Пример с maxWidth
view.pin.horizontally().maxWidth(200).justify(.center) // Центрирование при превышении maxWidth

//Вертикальное выравнивание (align)
//Когда заданы top, bottom и height - view может быть меньше доступного пространства:
view.pin.top().bottom().height(50).align(.top)        // По верхнему краю
view.pin.top().bottom().height(50).align(.center)     // По центру
view.pin.top().bottom().height(50).align(.bottom)     // По нижнему краю

//🌍 8. ПОДДЕРЖКА RTL/LTR
//PinLayout поддерживает право-лево языки (RTL):
// Настройка направления
Pin.layoutDirection(.leftToRight)  // Слева направо (по умолчанию)
Pin.layoutDirection(.rightToLeft)  // Справа налево
// RTL-совместимые методы
view.pin.start(10)         // В LTR = left(10), в RTL = right(10)
view.pin.end(10)           // В LTR = right(10), в RTL = left(10)
// RTL-совместимые якоря
view.pin.topStart()        // В LTR = topLeft(), в RTL = topRight()
view.pin.topEnd()          // В LTR = topRight(), в RTL = topLeft()
// RTL-совместимые позиционирования
view.pin.before(of: otherView)  // В LTR = left(of:), в RTL = right(of:)
view.pin.after(of: otherView)   // В LTR = right(of:), в RTL = left(of:)

//🔧 9. СПЕЦИАЛЬНЫЕ ОБЛАСТИ
//SafeArea (поддержка iOS 7+)
// PinLayout предоставляет safeArea даже на iOS 7-10!
view.pin.all(pin.safeArea)                    // Заполнить safeArea
view.pin.top(pin.safeArea)                    // Верх на safeArea.top
view.pin.left(pin.safeArea.left + 10)         // Лево на safeArea.left + 10px
view.pin.horizontally(pin.safeArea)           // Горизонтально в safeArea

//ReadableMargins и LayoutMargins
// ReadableMargins (для оптимального чтения текста)
view.pin.horizontally(pin.readableMargins)    // Горизонтально в readable области
// LayoutMargins
view.pin.all(pin.layoutMargins)               // По layoutMargins
