#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>

@interface MyDelegate : NSObject
{
  NSWindow *myWindow;
}
- (void) createMenu;
- (void) createWindow;
- (void) applicationWillFinishLaunching: (NSNotification *)not;
- (void) applicationDidFinishLaunching: (NSNotification *)not;
@end

@implementation MyDelegate : NSObject 
- (void) dealloc
{
  RELEASE (myWindow);
}

- (void) createMenu
{
  NSMenu *menu;

  menu = AUTORELEASE ([NSMenu new]);

  [menu addItemWithTitle: @"Quit"  
        action: @selector (terminate:)  
        keyEquivalent: @"q"];

  [NSApp setMainMenu: menu];
}

- (void) createWindow
{
  NSRect rect = NSMakeRect (100, 100, 200, 200);
  unsigned int styleMask = NSTitledWindowMask 
                           | NSMiniaturizableWindowMask;


  myWindow = [NSWindow alloc];
  myWindow = [myWindow initWithContentRect: rect
                       styleMask: styleMask
                       backing: NSBackingStoreBuffered
                       defer: NO];
  [myWindow setTitle: @"Mighf System Manager"];
}

- (void) applicationWillFinishLaunching: (NSNotification *)not
{
  [self createMenu];
  [self createWindow];
}

- (void) applicationDidFinishLaunching: (NSNotification *)not;
{
  [myWindow makeKeyAndOrderFront: nil];
}
@end

int main (int argc, const char **argv)
{ 
  [NSApplication sharedApplication];
  [NSApp setDelegate: [MyDelegate new]];

  return NSApplicationMain (argc, argv);
}