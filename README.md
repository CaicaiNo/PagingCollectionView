# PagingCollectionView
横向排列且横向滑动的UICollectionview

![](https://github.com/shengpeng3344/PagingCollectionView/blob/master/PagingCollectionView/pageCollectionviewGIf.gif)

你需要自定义layout，处理横向排列cell的逻辑，才能使collectionview按照我们的要求来排列，但并不使用系统的重排API,在自定义collectionview类中写重排逻辑
即利用collectionview的moveItemAtIndexPath:toIndexPath:接口，但前提是你要进行数据更新处理，数据源要删除，插入操作等都要先处理

1.删除功能暂未完善
2.添加功能暂未完善
3.拖动时还有Bug
