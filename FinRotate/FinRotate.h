//
//  FinRotate.h
//
//  Created by Mark Westneat on 3/20/18.
//  Copyright 2018 Mark Westneat. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FinRotate : NSView {
    double a, b, c, d, ang, tempang, con, k;
    double sidea, sideb, sidec, angab, angac, angbc, scalebar, scaledraw, finslope, rotang, xhop, yhop;
    double leadedge, trailedge, finaxis, dfinaxis,f1, f2, f3, f4, f5, f6, f7, f8, f9, f10;
    double area1, area2, area3, area4, area5, area6, area7, area8, area9, area10, area11, areatotal;
    double rot1, rot2, rot3, rot4, rot5, rot6, rot7, rot8, rot9, rot10, rotLE, rotTE; //fin rotation inputs
    double d31to1, d1to2, d2to3, d3to4, d4to5, d5to6, d6to33;  //leading edge pieces
    double d32to20, d20to19, d19to18, d18to17, d17to34;  //trailing edge pieces
    double d31to30, d30to29, d29to28, d28to27, d27to26, d26to25, d25to24, d24to23, d23to22, d22to21, d21to32;  //fin bases
    double d33to7, d7to8, d8to9, d9to10, d10to11, d11to12, d12to13, d13to14, d14to15, d15to16, d16to34;  //fin tops
    
    //Unscaled raw coordinates from file (scaled by scale bar on import)
    double x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15, x16, y16, x17, y17, x18, y18, x19, y19, x20, y20, x21, y21, x22, y22, x23, y23, x24, y24, x25, y25, x26, y26, x27, y27, x28, y28, x29, y29, x30, y30, x31, y31, x32, y32, x33, y33, x34, y34;
    
    //Multiply raw coordinates
    double mx1, my1, mx2, my2, mx3, my3, mx4, my4, mx5, my5, mx6, my6, mx7, my7, mx8, my8, mx9, my9, mx10, my10, mx11, my11, mx12, my12, mx13, my13, mx14, my14, mx15, my15, mx16, my16, mx17, my17, mx18, my18, mx19, my19, mx20, my20, mx21, my21, mx22, my22, mx23, my23, mx24, my24, mx25, my25, mx26, my26, mx27, my27, mx28, my28, mx29, my29, mx30, my30, mx31, my31, mx32, my32, mx33, my33, mx34, my34;
    
    //RotCoords- imported raw, then rotated with fin axis flat
    double rx1, ry1, rx2, ry2, rx3, ry3, rx4, ry4, rx5, ry5, rx6, ry6, rx7, ry7, rx8, ry8, rx9, ry9, rx10, ry10, rx11, ry11, rx12, ry12, rx13, ry13, rx14, ry14, rx15, ry15, rx16, ry16, rx17, ry17, rx18, ry18, rx19, ry19, rx20, ry20, rx21, ry21, rx22, ry22, rx23, ry23, rx24, ry24, rx25, ry25, rx26, ry26, rx27, ry27, rx28, ry28, rx29, ry29, rx30, ry30, rx31, ry31, rx32, ry32, rx33, ry33, rx34, ry34;

    //DrawCoords- imported raw, then scaled, then multiplied up to window size
    int dx1, dy1, dx2, dy2, dx3, dy3, dx4, dy4, dx5, dy5, dx6, dy6, dx7, dy7, dx8, dy8, dx9, dy9, dx10, dy10, dx11, dy11, dx12, dy12, dx13, dy13, dx14, dy14, dx15, dy15, dx16, dy16, dx17, dy17, dx18, dy18, dx19, dy19, dx20, dy20, dx21, dy21, dx22, dy22, dx23, dy23, dx24, dy24, dx25, dy25, dx26, dy26, dx27, dy27, dx28, dy28, dx29, dy29, dx30, dy30, dx31, dy31, dx32, dy32, dx33, dy33, dx34, dy34;
    
    //New fin coords after manipulation
	double nx1, ny1, nx2, ny2, nx3, ny3, nx4, ny4, nx5, ny5, nx6, ny6, nx7, ny7, nx8, ny8, nx9, ny9, nx10, ny10, nx11, ny11, nx12, ny12, nx13, ny13, nx14, ny14, nx15, ny15, nx16, ny16, nx17, ny17, nx18, ny18, nx19, ny19, nx20, ny20, nx21, ny21, nx22, ny22, nx23, ny23, nx24, ny24, nx25, ny25, nx26, ny26, nx27, ny27, nx28, ny28, nx29, ny29, nx30, ny30, nx31, ny31, nx32, ny32, nx33, ny33, nx34, ny34;
	
    int i, fishcount, rot, fishok, h, z, holdi, xstart, ystart, scale, check1, check2, check3, step;
    
    __unsafe_unretained NSWindow *window;
    
    NSMutableArray *specarray;
    
    NSMutableArray *fishx, *fishy, *rowx, *rowy;
    
    NSPoint pt[100];
    NSInteger selectedSegment;

    NSString *theFilePath;
    
    __unsafe_unretained IBOutlet NSButton *openButton;
    __unsafe_unretained IBOutlet NSButton *nextFinButton;
    __unsafe_unretained IBOutlet NSButton *prevFinButton;
    __unsafe_unretained IBOutlet NSButton *saveButton;
    __unsafe_unretained IBOutlet NSButton *magnifyButton;
    __unsafe_unretained IBOutlet NSButton *reduceButton;
    __unsafe_unretained IBOutlet NSButton *upButton;
    __unsafe_unretained IBOutlet NSButton *downButton;
    __unsafe_unretained IBOutlet NSButton *leftButton;
    __unsafe_unretained IBOutlet NSButton *rightButton;
    IBOutlet NSTextField *data1, *data2, *data3, *data4, *data5, *data6, *data7, *data8, *data9, *data10, *data11, *data12, *data13, *data14, *data15, *data16, *data17, *data18, *data19, *data20, *data21, *data22, *data23, *data24, *data25, *data26, *data27, *data28, *data29, *data30, *data31, *data32, *data33, *data34, *data35, *data36, *data37, *data38, *data39, *data40, *data41, *data42, *data43, *data44, *data45, *data46, *data47, *data48, *data49, *data50, *data51;
}

@property (unsafe_unretained) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSButton *openButton, *nextFinButton, *prevFinButton, *saveButton;
@property (unsafe_unretained) IBOutlet NSButton *magnifyButton, *reduceButton, *upButton, *downButton, *leftButton, *rightButton;
@property double rotLE, rot1, rot2, rot3, rot4, rot5, rot6, rot7, rot8, rot9, rot10, rotTE;
//@property int bins, opendur, jawrot;
- (IBAction)initvars:(id)sender;
- (IBAction)doOpen:(id)sender;
- (IBAction)changeSegment:(id)sender;
- (IBAction)nextFin:(id)sender;
- (IBAction)prevFin:(id)sender;
- (IBAction)savedata:(id)sender;
- (IBAction)magnify:(id)sender;
- (IBAction)reduce:(id)sender;
- (IBAction)upmove:(id)sender;
- (IBAction)downmove:(id)sender;
- (IBAction)leftmove:(id)sender;
- (IBAction)rightmove:(id)sender;
- (IBAction)calclinks:(id)sender;
- (IBAction)datatoscreen:(id)sender;

@end
