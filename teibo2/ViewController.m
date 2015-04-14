//
//  ViewController.m
//  teibo2
//
//  Created by minowaryohei on 2015/04/08.
//  Copyright (c) 2015年 rm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *tableData;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    tableData = [@[@"tableview", @"ホイルを開くとアツアツの湯気がふわ～っ。手軽に作れて洗い物が少なくすむのも魅力的。今日は何を包んでみる？", @"レパートリー不足を解消 毎日のお弁当レシピ"] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png", (int)indexPath.row+1]];
    
    UILabel *textLabel = (UILabel *)[cell viewWithTag:101];
    textLabel.text = tableData[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableData[indexPath.row] = [tableData[indexPath.row] stringByAppendingString: @"( ^ω^ )"];
    [tableView reloadData];
}

@end
