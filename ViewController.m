//
//  ViewController.m
//  coindesk
//
//  Created by Tops on 12/2/15.
//  Copyright (c) 2015 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tbl_vw;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
    NSURL *url=[NSURL URLWithString:@"https://api.coindesk.com/v1/bpi/currentprice.json"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    /*
    for (id ids in dict)
    {
        NSLog(@"KEY:%@ VALUE:%@",ids,[dict objectForKey:ids]);
    }
    */
    arr_eur=[[NSMutableArray alloc]initWithArray:[[[dict objectForKey:@"bpi"]objectForKey:@"EUR"]allValues]];
    
    img2=[UIImage imageNamed:@"euro.png"];
    [arr_eur replaceObjectAtIndex:2 withObject:img2];
    
    arr_gbp=[[NSMutableArray alloc]initWithArray:[[[dict objectForKey:@"bpi"]objectForKey:@"GBP"]allValues]];
    
    img3=[UIImage imageNamed:@"pound.png"];
    [arr_gbp replaceObjectAtIndex:2 withObject:img3];
    
    arr_usd=[[NSMutableArray alloc]initWithArray:[[[dict objectForKey:@"bpi"]objectForKey:@"USD"]allValues]];
    
    img4=[UIImage imageNamed:@"usd.png"];
    [arr_usd replaceObjectAtIndex:2 withObject:img4];
    
    NSLog(@"%@",arr_eur);
    NSLog(@"%@",arr_gbp);
    NSLog(@"%@",arr_usd);
    
    /*
    UIImage *img=[UIImage imageNamed:@"usd.png"];
    
    if ([[arr_eur objectAtIndex:3]isEqual:img])
    {
         NSLog(@"%@",[arr_eur objectAtIndex:2]);
    }
    else
    {
        NSLog(@"not equl");
    }
    */
   
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *index=@"";
    switch (section) {
        case 0:
            index=@"Below EUR";
            break;
        case 1:
            index=@"Below GBP";
            break;
        case 2:
            index=@"Below USD";
            break;
        default:
            break;
    }
    return index;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *index=@"";
    switch (section) {
        case 0:
            index=@"Above EUR";
            break;
        case 1:
            index=@"Above GBP";
            break;
        case 2:
            index=@"Above USD";
            break;
        default:
            break;
    }
    return index;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int index=0;
    switch (section) {
        case 0:
            index=(int)arr_eur.count;
            break;
        case 1:
            index=(int)arr_gbp.count;
            break;
        case 2:
            index=(int)arr_usd.count;
            break;
        default:
            break;
    }
    return index;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    

    switch (indexPath.section)
    {
        case 0:
            if ([[arr_eur objectAtIndex:indexPath.row]isEqual:img2])
            {
                cell.imageView.image=[arr_eur objectAtIndex:indexPath.row];
            }
            else
            {
                 cell.textLabel.text=[NSString stringWithFormat:@"%@",[arr_eur objectAtIndex:indexPath.row]];
            }
            
            break;
        case 1:
            if ([[arr_gbp objectAtIndex:indexPath.row]isEqual:img3])
            {
                cell.imageView.image=[arr_gbp objectAtIndex:indexPath.row];
            }
            else
            {
                cell.textLabel.text=[NSString stringWithFormat:@"%@",[arr_gbp objectAtIndex:indexPath.row]];
            }
            break;
        case 2:
            if ([[arr_usd objectAtIndex:indexPath.row]isEqual:img4])
            {
             cell.imageView.image=[arr_usd objectAtIndex:indexPath.row];
            }
            else
            {
                cell.textLabel.text=[NSString stringWithFormat:@"%@",[arr_usd objectAtIndex:indexPath.row]];
            }
            break;
        default:
            break;
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
