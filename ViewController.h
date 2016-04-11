//
//  ViewController.h
//  coindesk
//
//  Created by Tops on 12/2/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arr_eur;
    NSMutableArray *arr_gbp;
    NSMutableArray *arr_usd;
    UIImage *img2;
    UIImage *img3;
    UIImage *img4;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;

@end

