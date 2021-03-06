//
//  PageViewController.m
//  PagingScrollView
//
//  Created by Matt Gallagher on 24/01/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "PageViewController.h"
#import "DataSource.h"
#import <QuartzCore/QuartzCore.h>

const CGFloat TEXT_VIEW_PADDING = 50.0;

@implementation PageViewController

@synthesize pageIndex;
@synthesize badge;

- (void)setPageIndex:(NSInteger)newPageIndex
{
	pageIndex = newPageIndex;
	
	if (pageIndex >= 0 && pageIndex < [[DataSource sharedDataSource] numDataPages])
	{
		NSDictionary *pageData =
			[[DataSource sharedDataSource] dataForPage:pageIndex];
		label.text = [pageData objectForKey:@"pageName"];
		textView.text = [pageData objectForKey:@"pageText"];
        NSMutableString *imageName = [NSMutableString stringWithString:[pageData objectForKey:@"pageText"]];

        [imageName appendString:@".png"];
                NSLog(@"%@", imageName);
//		badge = [UIImage imageNamed:@"Editor.png"];
         [badge setImage:[UIImage imageNamed:imageName]];
		CGRect absoluteRect = [self.view.window
			convertRect:textView.bounds
			fromView:textView];
		if (!self.view.window ||
			!CGRectIntersectsRect(
				CGRectInset(absoluteRect, TEXT_VIEW_PADDING, TEXT_VIEW_PADDING),
				[self.view.window bounds]))
		{
			textViewNeedsUpdate = YES;
		}
	}
}

- (void)updateTextViews:(BOOL)force
{
	if (force ||
		(textViewNeedsUpdate &&
		self.view.window &&
		CGRectIntersectsRect(
			[self.view.window
				convertRect:CGRectInset(textView.bounds, TEXT_VIEW_PADDING, TEXT_VIEW_PADDING)
				fromView:textView],
			[self.view.window bounds])))
	{
		for (UIView *childView in textView.subviews)
		{
           // NSLog(@"Invalidating view %@", childView);
			[childView setNeedsDisplay];
		}
		textViewNeedsUpdate = NO;
	}
}

@end

