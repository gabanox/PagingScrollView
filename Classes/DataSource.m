//
//  DataSource.m
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

#import "DataSource.h"
#import "SynthesizeSingleton.h"

@implementation DataSource

SYNTHESIZE_SINGLETON_FOR_CLASS(DataSource);

//
// init
//
// Init method for the object.
//
- (id)init
{
	self = [super init];
	if (self != nil)
	{
		dataPages = [[NSArray alloc] initWithObjects:
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Page 1", @"pageName",
				@"Super Styler", @"pageText",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Page 2", @"pageName",
				@"HTML Basic", @"pageText",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Page 3", @"pageName",
				@"Thimble Projectizer", @"pageText",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Page 4", @"pageName",
				@"Div Master", @"pageText",
				nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
				@"Page 5", @"pageName",
				@"Web Maker", @"pageText",
				nil],
			nil];
	}
	return self;
}

- (NSInteger)numDataPages
{
	return [dataPages count];
}

- (NSDictionary *)dataForPage:(NSInteger)pageIndex
{
	return [dataPages objectAtIndex:pageIndex];
}

@end
