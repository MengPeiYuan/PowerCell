# PowerCell
利用原始UITableViewcell强大的自适应性能,改造UITableViewcell,与自定义UITableViewcell略有不同,详情说明请看文档



 一,自带UITableViewCell优势
 
 	1,iOS 自带UITableViewCell 只提供了四种已有方式

		//        typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
   		//            UITableViewCellStyleDefault,	// 默认风格，自带标题和一个图片视图，图片在左
		//            UITableViewCellStyleValue1,	// 只有标题和副标题 副标题在右边
		//            UITableViewCellStyleValue2,	// 只有标题和副标题，副标题在左边标题的下边
		//            UITableViewCellStyleSubtitle	// 自带图片视图和主副标题，主副标题都在左边，副标题在下
		//        };
	2,系统自带 cell 具有极强的自适应性.
	3,源代码已有封装好的自定义(控件,展示效果,排版布局).
		3.1:举个例子:在原始自带UITableViewCell默认标题textLabel的边界会随着 cell 的高宽变换而变换(变化包括textLabel
		    的长度和高度),随着文字的多少也会变换(变化包括textLabel的长度和高度)
		3.2:在3.1例子中,虽然完全自定义视图也能够实现,但是大大的增加了工作量,而且未必有原始UITableViewCell效果好.
		    所以,我选择了改造现有的UITableViewCell
二,自带UITableViewCell 劣势

	1,仅有的(布局,子视图数量)不能满足某些特定需求.

三,基于自带UITableViewCell的优势,改造UITableViewCell劣势(具体视需求而论)

	1,改变 cell 内间距.
	2,重绘原有子视图 frame( 由于基于原始UITableViewCell,这个 frame,是处于变化中的).
	3,修改 cell 边界风格.
	4,添加少许控件,改变子视图frame( 由于基于原始UITableViewCell,这个 frame,是处于变化中的).
	5,改造 原始子视图,可以继续使用子视图原有的属性.
	6,减少 alloc 次数.

四,谨以此项目交流学习.
