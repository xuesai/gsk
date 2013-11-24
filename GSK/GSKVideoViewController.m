//
//  GSKVideoViewController.m
//  GSK
//
//  Created by sai on 13-11-20.
//
//

#import "GSKVideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MPMoviePlayerController.h>
#import "GSKAppDelegate.h"

@interface GSKVideoViewController ()

@end

@implementation GSKVideoViewController
{
    NSArray *_videos;
    MPMoviePlayerController *_moviePlayer;
}
@synthesize tableView = _tableView;



- (void)playLocal2 {
    NSURL *movieURL = [[NSBundle mainBundle] URLForResource:@"AndrewWittyBroadcast-1Oct-Chinese" withExtension:@"mp4"];
    if (movieURL == nil) {
        [[[UIAlertView alloc] initWithTitle:nil message:@"can't find resource" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil] show];
    }
    [self playMovie:movieURL];
}


- (void)fetchVideoList {
    [Utility requestWithURLString:@"https://health.gsk-china.com/api/GetVideoAPI.ashx" parameters:nil withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSArray class]]) {
            _videos = responseObject;
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error.description);
    }];
}

- (void)playMovie:(NSURL*)aUrl {
    [_moviePlayer.view removeFromSuperview];
    _moviePlayer = [ [ MPMoviePlayerController alloc]initWithContentURL:aUrl];
    [_moviePlayer prepareToPlay];
    _moviePlayer.view.frame = CGRectMake(100, 100, 600, 400);
    [self.view addSubview:_moviePlayer.view];
    _moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
    _moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
    [_moviePlayer play];
}

- (void)exitFullScreen:(id)aSender {
    [_moviePlayer.view removeFromSuperview];
    _moviePlayer = nil;
}

- (void)dealloc {
    [_moviePlayer.view removeFromSuperview];
    _moviePlayer = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerDidExitFullscreenNotification object:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitFullScreen:) name: MPMoviePlayerDidExitFullscreenNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    UIButton *b2 = [[UIButton alloc] initWithFrame:CGRectMake(120, 80, 140, 30)];
    [b2 setTitle:@"播放本地视频" forState:UIControlStateNormal];
    b2.backgroundColor = [UIColor redColor];
    [b2 addTarget:self action:@selector(playLocal2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b2];
    
    [self fetchVideoList];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_videos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *item = [_videos objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"name"];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *item = [_videos objectAtIndex:indexPath.row];
    NSString *urlStr = [item objectForKey:@"video"];
    [self playMovie:[NSURL URLWithString:urlStr]];

}



@end
