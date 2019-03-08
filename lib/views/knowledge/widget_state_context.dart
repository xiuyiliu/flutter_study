/// Widget & state & context & InheritedWidget 关系


/// Context:
/// Context仅仅是所创建的Widget树结构中某个Widget的位置引用，
/// 一个context仅仅从属与一个widget,context 链接在一起，形成一个widget树，
/// （从树形结构可知，某些东西只能在自己的context或在其父context中可见,也可以从父context找到后代Widget，但不建议这样做）

/// Stateful Widget所持有的数据集在其生命周期内可能会发生变化，这样的数据成为State
/// State 定义了StatefulWidget的行为，应用与State的任何改变都会强制Widget进行重建

/// initState() 一旦initState方法执行完，State对象就被初始化，并且context变为可用，
/// 在该State对象的生命周期内将不会再次调用此方法

/// Widget的唯一标识，key:
/// 某些情况下，想使用这个key,通过这个key访问对应的Widget,可用用GlobalKey/LocalKey/UniqueKey/ObjectKey来生成Key

/// 访问State: 一个State被链接到一个Context,一个Context被链接到一个Widget实例
/// 父Widget可用通过WidgetKey.currentState的形式访问其子节点的State,WidgetKey为父Widget的key;

/// InheritedWidget允许在Widget树中有效的向下传播和共享信息，将作为另一个子树的父节点放置在Widget树中；
/// 该子树的所有Widget都能够与InheritedWidget暴露的数据进行交互。