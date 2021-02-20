import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:petmatch/theme/petsTheme.dart';
import 'package:petmatch/widgets/main/NavBarHolder.dart';

class CustomStack extends Stack {
  final bool isNavBar;

  CustomStack({alignment, children, this.isNavBar = false}) : super(children: children, alignment: alignment);

  @override
  CustomRenderStack createRenderObject(BuildContext context) {
    return CustomRenderStack(
        alignment: alignment,
        textDirection: textDirection ?? Directionality.of(context),
        fit: fit,
        isNavBar: isNavBar,
        screenSize: MediaQuery.of(context).size);
  }
}

class CustomRenderStack extends RenderStack {
  CustomRenderStack({alignment, textDirection, fit, overflow, this.isNavBar, this.screenSize})
      : super(alignment: alignment, textDirection: textDirection, fit: fit);

  bool isNavBar;
  Size screenSize;

  bool isRealNavArea(Size size, Offset position) {

    double firstLimit = size.width * NavBarHolder.xStart;
    double endLimit = size.width * NavBarHolder.xEnd;
    double expandedFirstLimit = size.width * NavBarHolder.xExpandedStart;
    double expandedEndLimit = size.width * NavBarHolder.xExpandedEnd;
    if (position.dx > expandedFirstLimit &&
        position.dx < expandedEndLimit &&
        NavBarHolder.expanded &&
        (position.dy > size.height * (1 - PetsTheme.getNavBarHeight()))) {
      return true;
    }
    if (position.dx > firstLimit &&
        position.dx < endLimit &&
        !NavBarHolder.expanded &&
        (position.dy > size.height * (1 - 1.5 * NavBarHolder.navBarContainerHeight))) {
      return true;
    }
    return false;
  }

  bool isNavArea(Size size, Offset position) {
    //checks whether the hit is in the whole Nav Contaier Area or no

    if (position.dy > size.height * (1 - PetsTheme.getNavBarHeight())) //hit under the bar
    {
      return true;
    } else {
      return false;
    }
  }

  bool isLayersPassed(int currentLayer) {
    const layersMax = 0;
    return (currentLayer > layersMax);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    int layers = 0;

    RenderBox child = lastChild;
    while (child != null) {
      final StackParentData childParentData = child.parentData as StackParentData;
      final bool isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (BoxHitTestResult result, Offset transformed) {
          assert(transformed == position - childParentData.offset);
          // return child.hitTest(result, position: transformed);
          if (!isNavBar) {
            return child.hitTest(result, position: transformed);
          } else if (isNavArea(size, position)) {
       
            if (isRealNavArea(size, position)) {
              return child.hitTest(result, position: transformed);
            } else if (!isLayersPassed(layers++)) {
              return false;
            } else {
              return child.hitTest(result, position: transformed);
            }
          } else {
            return child.hitTest(result, position: transformed);
          }
        },
      );
      if (isHit) return true;
      child = childParentData.previousSibling;
    }
    return false;
  }
}
