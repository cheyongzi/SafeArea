# SafeArea
在适配iPhone X过程中，发现很多地方需要针对系统做判断处理，UIViewController+SafeArea解决SafeArea向低版本兼容问题

# Requirements
- Xcode9.0+
- iOS8.0+

# Communication
有任何问题可以通过issue或者QQ(389936133)的方式

# Usage
    [self.contentView addSubview:self.tableView];

      UIScrollView *scrollView = [UIScrollView new];
      scrollView.backgroundColor = [UIColor redColor];
      [self.contentView addSubview:scrollView];

      [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.right.and.top.equalTo(self.contentView);
          make.height.mas_equalTo(60);
      }];
      [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.bottom.and.right.equalTo(self.contentView);
          make.top.equalTo(scrollView.mas_bottom);
      }];



