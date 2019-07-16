import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/custom_stepper.dart';

List<CustomStep> customSteps = [
  CustomStep(
    title: Text('ยื่นเอกสารยืนยันตัวตน'),
    subtitle: Text('เสร็จสิ้น'),
    state: CustomStepState.indexed,
    isActive: true
  ),
  CustomStep(
      title: Text('ซื้อสินค้าขั้นต่ำ200PV ในยอดการสั่งซื้อเพียงครั้งเดียว',maxLines: 2, overflow: TextOverflow.ellipsis,softWrap: true,),
      subtitle: Text('เสร็จสิ้น'),
      content: Text('content'),
      state: CustomStepState.complete,
      isActive: true
  ),
  CustomStep(
      editingText: Text('เลื่อนระดับเป็น JP'),
      state: CustomStepState.editing,
      isActive: true
  ),
  CustomStep(
      title: Text(
        'มี JP ที่เป็นฟร้อนไลน์ มากกว่าหรือเท่ากับ \n 5 สายงาน',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text('ทำให้เสร็จ'),
      state: CustomStepState.unComplete,
      isActive: false
  ),
  CustomStep(
      editingText: Text('เลื่อนระดับเป็น SP'),
      state: CustomStepState.editing,
      isActive: false
  ),
  CustomStep(
      title: Text('มีดาวน์ไลน์ที่เป็นระดับ SP ในสามสายงาน'),
      content: Text('content'),
      state: CustomStepState.error,
      isActive: false
  ),
];

class CustomStepperDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('custom-stepper'),
      ),
      body: Container(
        child: CustomStepper(
          steps: customSteps,
        ),
//        child: new Stepper(
//          currentStep: 0,  // <-- 激活的下标
//          steps: <Step>[
//            new Step(
//              title: new Text('第一步'),
//              content: new Text('第一步内容'),
//              state: StepState.complete,
//              isActive: true,
//              subtitle: new Text('第一步小标题'),
//            ),
//            new Step(
//              title: Container(
//                height: 200,
//                child: Center(
//                  child: Text('step 2'),
//                ),
//              ),
//              content: new Text('第二步内容'),
//            ),
//            new Step(
//              title: new Text('第三步'),
//              content: new Text('第三步内容'),
//            ),
//          ],
//        ),
      )
    );
  }
}
