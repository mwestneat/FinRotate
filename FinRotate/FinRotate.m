//
//  FinRotate.m
//  FinRotate
//
//  Created by Mark Westneat on 4/10/14.
//  Copyright 2014 Mark Westneat. All rights reserved.
//

#import "FinRotate.h"

@implementation FinRotate
@synthesize window;
@synthesize openButton, nextFinButton, prevFinButton, saveButton, magnifyButton, reduceButton, upButton, downButton, leftButton, rightButton;
@synthesize rotLE, rot1, rot2, rot3, rot4, rot5, rot6, rot7, rot8, rot9, rot10, rotTE;

- (IBAction)initvars:(id)sender
{
    con = 0.017453;
    xstart = 200;
    ystart = 250;
    scale = 350;
    scaledraw= 1;
    step=2;
    afin=0;
    rotLE=0;
    rotTE=0;
    rot1=0;
    rot2=0;
    rot3=0;
    rot4=0;
    rot5=0;
    rot6=0;
    rot7=0;
    rot8=0;
    rot9=0;
    rot10=0;
    
}

- (IBAction)clearRotState:(id)sender
{
    [LEneg setState:NSOffState];
    [R1neg setState:NSOffState];
    [R2neg setState:NSOffState];
    [R3neg setState:NSOffState];
    [R4neg setState:NSOffState];
    [R5neg setState:NSOffState];
    [R6neg setState:NSOffState];
    [R7neg setState:NSOffState];
    [R8neg setState:NSOffState];
    [R9neg setState:NSOffState];
    [R10neg setState:NSOffState];
    [TEneg setState:NSOffState];
}

- (IBAction)getRotState:(id)sender
{
    if (rotLE<0){[LEneg setState:NSOnState];}
    if (rot1<0){[R1neg setState:NSOnState];}
    if (rot2<0){[R2neg setState:NSOnState];}
    if (rot3<0){[R3neg setState:NSOnState];}
    if (rot4<0){[R4neg setState:NSOnState];}
    if (rot5<0){[R5neg setState:NSOnState];}
    if (rot6<0){[R6neg setState:NSOnState];}
    if (rot7<0){[R7neg setState:NSOnState];}
    if (rot8<0){[R8neg setState:NSOnState];}
    if (rot9<0){[R9neg setState:NSOnState];}
    if (rot10<0){[R10neg setState:NSOnState];}
    if (rotTE<0){[TEneg setState:NSOnState];}
}


//---------------------------------------------------------------------------------
- (IBAction)trianglecalc:(id)sender
{
    check1 = 0;
    check2 = 0;
    check3 = 0;
    
    if (sidea*sidea < (sideb*sideb + sidec*sidec))
    {   a = sideb*sideb + sidec*sidec - sidea*sidea;
        b = 2 * sideb * sidec;
        angbc = acos(a/b)/(con);
        check1 = 1;}
    
    if (sideb*sideb < (sidea*sidea + sidec*sidec))
    {   a = sidea*sidea + sidec*sidec - sideb*sideb;
        b = 2 * sidea * sidec;
        angac = acos(a/b)/(con);
        check2 = 1;}
    
    if (sidec*sidec < (sidea*sidea + sideb*sideb))
    {   a = sidea*sidea + sideb*sideb - sidec*sidec;
        b = 2 * sidea * sideb;
        angab = acos(a/b)/(con);;
        check3 = 1;}
    if (check1 == 1) {if (check2 == 1) {angab = 180 - (angbc + angac);}}
    if (check1 == 1) {if (check3 == 1) {angac = 180 - (angab + angbc);}}
    if (check2 == 1) {if (check3 == 1) {angbc = 180 - (angab + angac);}}
}

//---------------------------------------------------------------------------------
- (IBAction)processdata:(id)sender
{
    area1= fabs((x30*y31-y30*x31)+(x31*y1-y31*x1)+(x1*y2-y1*x2)+(x2*y3-y2*x3)+(x3*y4-y3*x4)+(x4*y5-y4*x5)+(x5*y6-y5*x6)+(x6*y33-y6*x33)+(x33*y7-y33*x7)+(x7*y30-y7*x30))/2;
    area2= fabs((x7*y8-y7*x8)+(x8*y29-y8*x29)+(x29*y30-y29*x30)+(x30*y7-y30*x7))/2;
    area3= fabs((x8*y9-y8*x9)+(x9*y28-y9*x28)+(x28*y29-y28*x29)+(x29*y8-y29*x8))/2;
    area4= fabs((x9*y10-y9*x10)+(x10*y27-y10*x27)+(x27*y28-y27*x28)+(x28*y9-y28*x9))/2;
    area5= fabs((x10*y11-y10*x11)+(x11*y26-y11*x26)+(x26*y27-y26*x27)+(x27*y10-y27*x10))/2;
    area6= fabs((x11*y12-y11*x12)+(x12*y25-y12*x25)+(x25*y26-y25*x26)+(x26*y11-y26*x11))/2;
    area7= fabs((x12*y13-y12*x13)+(x13*y24-y13*x24)+(x24*y25-y24*x25)+(x25*y12-y25*x12))/2;
    area8= fabs((x13*y14-y13*x14)+(x14*y23-y14*x23)+(x23*y24-y23*x24)+(x24*y13-y24*x13))/2;
    area9= fabs((x14*y15-y14*x15)+(x15*y22-y15*x22)+(x22*y23-y22*x23)+(x23*y14-y23*x14))/2;
    area10=fabs((x15*y16-y15*x16)+(x16*y21-y16*x21)+(x21*y22-y21*x22)+(x22*y15-y22*x15))/2;
    area11=fabs((x21*y32-y21*x32)+(x32*y20-y32*x20)+(x20*y19-y20*x19)+(x19*y18-y19*x18)+(x18*y17-y18*x17)+(x17*y34-y17*x34)+(x34*y16-y34*x16)+(x16*y21-y16*x21))/2;
    areatotal= area1+area2+area3+area4+area5+area6+area7+area8+area9+area10+area11;
    
    rarea1= fabs((rx30*ry31-ry30*rx31)+(rx31*ry1-ry31*rx1)+(rx1*ry2-ry1*rx2)+(rx2*ry3-ry2*rx3)+(rx3*ry4-ry3*rx4)+(rx4*ry5-ry4*rx5)+(rx5*ry6-ry5*rx6)+(rx6*ry33-ry6*rx33)+(rx33*ry7-ry33*rx7)+(rx7*ry30-ry7*rx30))/2;
    rarea2= fabs((rx7*ry8-ry7*rx8)+(rx8*ry29-ry8*rx29)+(rx29*ry30-ry29*rx30)+(rx30*ry7-ry30*rx7))/2;
    rarea3= fabs((rx8*ry9-ry8*rx9)+(rx9*ry28-ry9*rx28)+(rx28*ry29-ry28*rx29)+(rx29*ry8-ry29*rx8))/2;
    rarea4= fabs((rx9*ry10-ry9*rx10)+(rx10*ry27-ry10*rx27)+(rx27*ry28-ry27*rx28)+(rx28*ry9-ry28*rx9))/2;
    rarea5= fabs((rx10*ry11-ry10*rx11)+(rx11*ry26-ry11*rx26)+(rx26*ry27-ry26*rx27)+(rx27*ry10-ry27*rx10))/2;
    rarea6= fabs((rx11*ry12-ry11*rx12)+(rx12*ry25-ry12*rx25)+(rx25*ry26-ry25*rx26)+(rx26*ry11-ry26*rx11))/2;
    rarea7= fabs((rx12*ry13-ry12*rx13)+(rx13*ry24-ry13*rx24)+(rx24*ry25-ry24*rx25)+(rx25*ry12-ry25*rx12))/2;
    rarea8= fabs((rx13*ry14-ry13*rx14)+(rx14*ry23-ry14*rx23)+(rx23*ry24-ry23*rx24)+(rx24*ry13-ry24*rx13))/2;
    rarea9= fabs((rx14*ry15-ry14*rx15)+(rx15*ry22-ry15*rx22)+(rx22*ry23-ry22*rx23)+(rx23*ry14-ry23*rx14))/2;
    rarea10=fabs((rx15*ry16-ry15*rx16)+(rx16*ry21-ry16*rx21)+(rx21*ry22-ry21*rx22)+(rx22*ry15-ry22*rx15))/2;
    rarea11=fabs((rx21*ry32-ry21*rx32)+(rx32*ry20-ry32*rx20)+(rx20*ry19-ry20*rx19)+(rx19*ry18-ry19*rx18)+(rx18*ry17-ry18*rx17)+(rx17*ry34-ry17*rx34)+(rx34*ry16-ry34*rx16)+(rx16*ry21-ry16*rx21))/2;
    rareatotal= rarea1+rarea2+rarea3+rarea4+rarea5+rarea6+rarea7+rarea8+rarea9+rarea10+rarea11;
 }


//---------------------------------------------------------------------------------
//Data To Screen
- (IBAction)datatoscreen:(id)sender {
    //[data14 setStringValue: [specarray objectAtIndex: i]];
    [data14 setStringValue:[NSString stringWithFormat:@"%@",[specarray objectAtIndex: i]]];
    [data1 setStringValue:[NSString stringWithFormat:@"%f",f1]];
    [data2 setStringValue:[NSString stringWithFormat:@"%f",f2]];
    [data3 setStringValue:[NSString stringWithFormat:@"%f",f3]];
    [data4 setStringValue:[NSString stringWithFormat:@"%f",f4]];
    [data5 setStringValue:[NSString stringWithFormat:@"%f",f5]];
    [data6 setStringValue:[NSString stringWithFormat:@"%f",f6]];
    [data7 setStringValue:[NSString stringWithFormat:@"%f",f7]];
    [data8 setStringValue:[NSString stringWithFormat:@"%f",f8]];
    [data9 setStringValue:[NSString stringWithFormat:@"%f",f9]];
    [data10 setStringValue:[NSString stringWithFormat:@"%f",f10]];
    [data11 setStringValue:[NSString stringWithFormat:@"%f",finaxis]];
    [data12 setStringValue:[NSString stringWithFormat:@"%f",leadedge]];
    [data13 setStringValue:[NSString stringWithFormat:@"%f",trailedge]];
    [data15 setStringValue:[NSString stringWithFormat:@"%f",areatotal]];
    [data16 setStringValue:[NSString stringWithFormat:@"%f",area1]];
    [data17 setStringValue:[NSString stringWithFormat:@"%f",area2]];
    [data18 setStringValue:[NSString stringWithFormat:@"%f",area3]];
    [data19 setStringValue:[NSString stringWithFormat:@"%f",area4]];
    [data20 setStringValue:[NSString stringWithFormat:@"%f",area5]];
    [data21 setStringValue:[NSString stringWithFormat:@"%f",area6]];
    [data22 setStringValue:[NSString stringWithFormat:@"%f",area7]];
    [data23 setStringValue:[NSString stringWithFormat:@"%f",area8]];
    [data24 setStringValue:[NSString stringWithFormat:@"%f",area9]];
    [data25 setStringValue:[NSString stringWithFormat:@"%f",area10]];
    [data26 setStringValue:[NSString stringWithFormat:@"%f",area11]];
    [data27 setStringValue:[NSString stringWithFormat:@"%f",rotLE]];
    [data28 setStringValue:[NSString stringWithFormat:@"%f",rot1]];
    [data29 setStringValue:[NSString stringWithFormat:@"%f",rot2]];
    [data30 setStringValue:[NSString stringWithFormat:@"%f",rot3]];
    [data31 setStringValue:[NSString stringWithFormat:@"%f",rot4]];
    [data32 setStringValue:[NSString stringWithFormat:@"%f",rot5]];
    [data33 setStringValue:[NSString stringWithFormat:@"%f",rot6]];
    [data34 setStringValue:[NSString stringWithFormat:@"%f",rot7]];
    [data35 setStringValue:[NSString stringWithFormat:@"%f",rot8]];
    [data36 setStringValue:[NSString stringWithFormat:@"%f",rot9]];
    [data37 setStringValue:[NSString stringWithFormat:@"%f",rot10]];
    [data38 setStringValue:[NSString stringWithFormat:@"%f",rotTE]];
    
    [data39 setStringValue:[NSString stringWithFormat:@"%i",fishcount]];
    
    [data40 setStringValue:[NSString stringWithFormat:@"%f",rareatotal]];
    [data41 setStringValue:[NSString stringWithFormat:@"%f",rarea1]];
    [data42 setStringValue:[NSString stringWithFormat:@"%f",rarea2]];
    [data43 setStringValue:[NSString stringWithFormat:@"%f",rarea3]];
    [data44 setStringValue:[NSString stringWithFormat:@"%f",rarea4]];
    [data45 setStringValue:[NSString stringWithFormat:@"%f",rarea5]];
    [data46 setStringValue:[NSString stringWithFormat:@"%f",rarea6]];
    [data47 setStringValue:[NSString stringWithFormat:@"%f",rarea7]];
    [data48 setStringValue:[NSString stringWithFormat:@"%f",rarea8]];
    [data49 setStringValue:[NSString stringWithFormat:@"%f",rarea9]];
    [data50 setStringValue:[NSString stringWithFormat:@"%f",rarea10]];
    [data51 setStringValue:[NSString stringWithFormat:@"%f",rarea11]];

    }
//---------------------------------------------------------------------------------
- (IBAction)calclinks:(id)sender {
    finaxis= sqrt((x32-x31)*(x32-x31)+(y32-y31)*(y32-y31));
    f1= sqrt((x30-x7)*(x30-x7)+(y30-y7)*(y30-y7));
    f2= sqrt((x29-x8)*(x29-x8)+(y29-y8)*(y29-y8));
    f3= sqrt((x28-x9)*(x28-x9)+(y28-y9)*(y28-y9));
    f4= sqrt((x27-x10)*(x27-x10)+(y27-y10)*(y27-y10));
    f5= sqrt((x26-x11)*(x26-x11)+(y26-y11)*(y26-y11));
    f6= sqrt((x25-x12)*(x25-x12)+(y25-y12)*(y25-y12));
    f7= sqrt((x24-x13)*(x24-x13)+(y24-y13)*(y24-y13));
    f8= sqrt((x23-x14)*(x23-x14)+(y23-y14)*(y23-y14));
    f9= sqrt((x22-x15)*(x22-x15)+(y22-y15)*(y22-y15));
    f10= sqrt((x21-x16)*(x21-x16)+(y21-y16)*(y21-y16));
    
    
    d31to1= sqrt((x31-x1)*(x31-x1)+(y31-y1)*(y31-y1));
    d1to2= sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    d2to3= sqrt((x2-x3)*(x2-x3)+(y2-y3)*(y2-y3));
    d3to4= sqrt((x3-x4)*(x3-x4)+(y3-y4)*(y3-y4));
    d4to5= sqrt((x4-x5)*(x4-x5)+(y4-y5)*(y4-y5));
    d5to6= sqrt((x5-x6)*(x5-x6)+(y5-y6)*(y5-y6));
    d6to33= sqrt((x6-x33)*(x6-x33)+(y6-y33)*(y6-y33));
    
    d32to20= sqrt((x32-x20)*(x32-x20)+(y32-y20)*(y32-y20));
    d20to19= sqrt((x20-x19)*(x20-x19)+(y20-y19)*(y20-y19));
    d19to18= sqrt((x19-x18)*(x19-x18)+(y19-y18)*(y19-y18));
    d18to17= sqrt((x18-x17)*(x18-x17)+(y18-y17)*(y18-y17));
    d17to34= sqrt((x17-x34)*(x17-x34)+(y17-y34)*(y17-y34));
    
    d31to30= sqrt((x31-x30)*(x31-x30)+(y31-y30)*(y31-y30));
    d30to29= sqrt((x30-x29)*(x30-x29)+(y30-y29)*(y30-y29));
    d29to28= sqrt((x29-x28)*(x29-x28)+(y29-y28)*(y29-y28));
    d28to27= sqrt((x28-x27)*(x28-x27)+(y28-y27)*(y28-y27));
    d27to26= sqrt((x27-x26)*(x27-x26)+(y27-y26)*(y27-y26));
    d26to25= sqrt((x26-x25)*(x26-x25)+(y26-y25)*(y26-y25));
    d25to24= sqrt((x25-x24)*(x25-x24)+(y25-y24)*(y25-y24));
    d24to23= sqrt((x24-x23)*(x24-x23)+(y24-y23)*(y24-y23));
    d23to22= sqrt((x23-x22)*(x23-x22)+(y23-y22)*(y23-y22));
    d22to21= sqrt((x22-x21)*(x22-x21)+(y22-y21)*(y22-y21));
    d21to32= sqrt((x21-x32)*(x21-x32)+(y21-y32)*(y21-y32));
    
    d33to7= sqrt((x33-x7)*(x33-x7)+(y33-y7)*(y33-y7));
    d7to8= sqrt((x7-x8)*(x7-x8)+(y7-y8)*(y7-y8));
    d8to9= sqrt((x8-x9)*(x8-x9)+(y8-y9)*(y8-y9));
    d9to10= sqrt((x9-x10)*(x9-x10)+(y9-y10)*(y9-y10));
    d10to11= sqrt((x10-x11)*(x10-x11)+(y10-y11)*(y10-y11));
    d11to12= sqrt((x11-x12)*(x11-x12)+(y11-y12)*(y11-y12));
    d12to13= sqrt((x12-x13)*(x12-x13)+(y12-y13)*(y12-y13));
    d13to14= sqrt((x13-x14)*(x13-x14)+(y13-y14)*(y13-y14));
    d14to15= sqrt((x14-x15)*(x14-x15)+(y14-y15)*(y14-y15));
    d15to16= sqrt((x15-x16)*(x15-x16)+(y15-y16)*(y15-y16));
    d16to34= sqrt((x16-x34)*(x16-x34)+(y16-y34)*(y16-y34));
    
    leadedge= d31to1+d1to2+d2to3+d3to4+d4to5+d5to6+d6to33;
    trailedge= d32to20+d20to19+d19to18+d18to17+d17to34;
}

/*
//---------------------------------------Make x Coords positive for area calcs
- (IBAction)xposCoords:(id)sender {
x1= x1+step;
x2= x2+step;
x3= x3+step;
x4= x4+step;
x5= x5+step;
x6= x6+step;
x7= x7+step;
x8= x8+step;
x9= x9+step;
x10= x10+step;
x11= x11+step;
x12= x12+step;
x13= x13+step;
x14= x14+step;
x15= x15+step;
x16= x16+step;
x17= x17+step;
x18= x18+step;
x19= x19+step;
x20= x20+step;
x21= x21+step;
x22= x22+step;
x23= x23+step;
x24= x24+step;
x25= x25+step;
x26= x26+step;
x27= x27+step;
x28= x28+step;
x29= x29+step;
x30= x30+step;
x31= x31+step;
x32= x32+step;
x33= x33+step;
x34= x34+step;
}
//---------------------------------------Make y Coords positive for area calcs
- (IBAction)yposCoords:(id)sender {
y1= y1+step;
y2= y2+step;
y3= y3+step;
y4= y4+step;
y5= y5+step;
y6= y6+step;
y7= y7+step;
y8= y8+step;
y9= y9+step;
y10= y10+step;
y11= y11+step;
y12= y12+step;
y13= y13+step;
y14= y14+step;
y15= y15+step;
y16= y16+step;
y17= y17+step;
y18= y18+step;
y19= y19+step;
y20= y20+step;
y21= y21+step;
y22= y22+step;
y23= y23+step;
y24= y24+step;
y25= y25+step;
y26= y26+step;
y27= y27+step;
y28= y28+step;
y29= y29+step;
y30= y30+step;
y31= y31+step;
y32= y32+step;
y33= y33+step;
y34= y34+step;
}
 */

//----------------------------------------------------------------
- (IBAction)LeftRight:(id)sender {
    dx1= dx1+step;
    dx2= dx2+step;
    dx3= dx3+step;
    dx4= dx4+step;
    dx5= dx5+step;
    dx6= dx6+step;
    dx7= dx7+step;
    dx8= dx8+step;
    dx9= dx9+step;
    dx10= dx10+step;
    dx11= dx11+step;
    dx12= dx12+step;
    dx13= dx13+step;
    dx14= dx14+step;
    dx15= dx15+step;
    dx16= dx16+step;
    dx17= dx17+step;
    dx18= dx18+step;
    dx19= dx19+step;
    dx20= dx20+step;
    dx21= dx21+step;
    dx22= dx22+step;
    dx23= dx23+step;
    dx24= dx24+step;
    dx25= dx25+step;
    dx26= dx26+step;
    dx27= dx27+step;
    dx28= dx28+step;
    dx29= dx29+step;
    dx30= dx30+step;
    dx31= dx31+step;
    dx32= dx32+step;
    dx33= dx33+step;
    dx34= dx34+step;
}

//----------------------------------------------------------------
- (IBAction)UpDown:(id)sender {
    dy1= dy1+step;
    dy2= dy2+step;
    dy3= dy3+step;
    dy4= dy4+step;
    dy5= dy5+step;
    dy6= dy6+step;
    dy7= dy7+step;
    dy8= dy8+step;
    dy9= dy9+step;
    dy10= dy10+step;
    dy11= dy11+step;
    dy12= dy12+step;
    dy13= dy13+step;
    dy14= dy14+step;
    dy15= dy15+step;
    dy16= dy16+step;
    dy17= dy17+step;
    dy18= dy18+step;
    dy19= dy19+step;
    dy20= dy20+step;
    dy21= dy21+step;
    dy22= dy22+step;
    dy23= dy23+step;
    dy24= dy24+step;
    dy25= dy25+step;
    dy26= dy26+step;
    dy27= dy27+step;
    dy28= dy28+step;
    dy29= dy29+step;
    dy30= dy30+step;
    dy31= dy31+step;
    dy32= dy32+step;
    dy33= dy33+step;
    dy34= dy34+step;
}


//----------------------------------------------------------------
- (IBAction) CoordsFromArray:(id)sender {
    rowx=[fishx objectAtIndex:i];
    x1= [[rowx objectAtIndex:1]doubleValue];
    x2= [[rowx objectAtIndex:2]doubleValue];
    x3= [[rowx objectAtIndex:3]doubleValue];
    x4= [[rowx objectAtIndex:4]doubleValue];
    x5= [[rowx objectAtIndex:5]doubleValue];
    x6= [[rowx objectAtIndex:6]doubleValue];
    x7= [[rowx objectAtIndex:7]doubleValue];
    x8= [[rowx objectAtIndex:8]doubleValue];
    x9= [[rowx objectAtIndex:9]doubleValue];
    x10= [[rowx objectAtIndex:10]doubleValue];
    x11= [[rowx objectAtIndex:11]doubleValue];
    x12= [[rowx objectAtIndex:12]doubleValue];
    x13= [[rowx objectAtIndex:13]doubleValue];
    x14= [[rowx objectAtIndex:14]doubleValue];
    x15= [[rowx objectAtIndex:15]doubleValue];
    x16= [[rowx objectAtIndex:16]doubleValue];
    x17= [[rowx objectAtIndex:17]doubleValue];
    x18= [[rowx objectAtIndex:18]doubleValue];
    x19= [[rowx objectAtIndex:19]doubleValue];
    x20= [[rowx objectAtIndex:20]doubleValue];
    x21= [[rowx objectAtIndex:21]doubleValue];
    x22= [[rowx objectAtIndex:22]doubleValue];
    x23= [[rowx objectAtIndex:23]doubleValue];
    x24= [[rowx objectAtIndex:24]doubleValue];
    x25= [[rowx objectAtIndex:25]doubleValue];
    x26= [[rowx objectAtIndex:26]doubleValue];
    x27= [[rowx objectAtIndex:27]doubleValue];
    x28= [[rowx objectAtIndex:28]doubleValue];
    x29= [[rowx objectAtIndex:29]doubleValue];
    x30= [[rowx objectAtIndex:30]doubleValue];
    x31= [[rowx objectAtIndex:31]doubleValue];
    x32= [[rowx objectAtIndex:32]doubleValue];
    x33= [[rowx objectAtIndex:33]doubleValue];
    x34= [[rowx objectAtIndex:34]doubleValue];
    
    rowy=[fishy objectAtIndex:i];
    y1= [[rowy objectAtIndex:1]doubleValue];
    y2= [[rowy objectAtIndex:2]doubleValue];
    y3= [[rowy objectAtIndex:3]doubleValue];
    y4= [[rowy objectAtIndex:4]doubleValue];
    y5= [[rowy objectAtIndex:5]doubleValue];
    y6= [[rowy objectAtIndex:6]doubleValue];
    y7= [[rowy objectAtIndex:7]doubleValue];
    y8= [[rowy objectAtIndex:8]doubleValue];
    y9= [[rowy objectAtIndex:9]doubleValue];
    y10= [[rowy objectAtIndex:10]doubleValue];
    y11= [[rowy objectAtIndex:11]doubleValue];
    y12= [[rowy objectAtIndex:12]doubleValue];
    y13= [[rowy objectAtIndex:13]doubleValue];
    y14= [[rowy objectAtIndex:14]doubleValue];
    y15= [[rowy objectAtIndex:15]doubleValue];
    y16= [[rowy objectAtIndex:16]doubleValue];
    y17= [[rowy objectAtIndex:17]doubleValue];
    y18= [[rowy objectAtIndex:18]doubleValue];
    y19= [[rowy objectAtIndex:19]doubleValue];
    y20= [[rowy objectAtIndex:20]doubleValue];
    y21= [[rowy objectAtIndex:21]doubleValue];
    y22= [[rowy objectAtIndex:22]doubleValue];
    y23= [[rowy objectAtIndex:23]doubleValue];
    y24= [[rowy objectAtIndex:24]doubleValue];
    y25= [[rowy objectAtIndex:25]doubleValue];
    y26= [[rowy objectAtIndex:26]doubleValue];
    y27= [[rowy objectAtIndex:27]doubleValue];
    y28= [[rowy objectAtIndex:28]doubleValue];
    y29= [[rowy objectAtIndex:29]doubleValue];
    y30= [[rowy objectAtIndex:30]doubleValue];
    y31= [[rowy objectAtIndex:31]doubleValue];
    y32= [[rowy objectAtIndex:32]doubleValue];
    y33= [[rowy objectAtIndex:33]doubleValue];
    y34= [[rowy objectAtIndex:34]doubleValue];
    
 /*   if (x31<0) {
        step=2;
        while (x31<0){ [self xposCoords:nil];}}
    if (x4<0) {
        step=2;
        while (x4<0){ [self xposCoords:nil];}}
    
    if (y31<0) {
        step=2;
        while (y31<0){ [self yposCoords:nil];}}
    if (y32<0) {
        step=2;
        while (y32<0){ [self yposCoords:nil];}}   */
        
}

//------------------------------------------------------Saves user changes to rot values in arrays  rotarray:rowrot
- (IBAction)setRot:(id)sender
{
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:1 withObject:[NSNumber numberWithDouble:rotLE]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:2 withObject:[NSNumber numberWithDouble:rot1]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:3 withObject:[NSNumber numberWithDouble:rot2]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:4 withObject:[NSNumber numberWithDouble:rot3]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:5 withObject:[NSNumber numberWithDouble:rot4]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:6 withObject:[NSNumber numberWithDouble:rot5]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:7 withObject:[NSNumber numberWithDouble:rot6]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:8 withObject:[NSNumber numberWithDouble:rot7]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:9 withObject:[NSNumber numberWithDouble:rot8]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:10 withObject:[NSNumber numberWithDouble:rot9]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:11 withObject:[NSNumber numberWithDouble:rot10]];
    [[rotarray objectAtIndex:i]replaceObjectAtIndex:12 withObject:[NSNumber numberWithDouble:rotTE]];
}

//-------------------------------------------------Retrieves user changes to rot values in arrays  rotarray:rowrot
- (IBAction)getRot:(id)sender
{
    rotLE= [[[rotarray objectAtIndex:i]objectAtIndex:1]doubleValue]; //rotLE 1
    rot1= [[[rotarray objectAtIndex:i]objectAtIndex:2]doubleValue];  //rot1 2
    rot2= [[[rotarray objectAtIndex:i]objectAtIndex:3]doubleValue];   //rot2 3
    rot3= [[[rotarray objectAtIndex:i]objectAtIndex:4]doubleValue];   //rot3 4
    rot4= [[[rotarray objectAtIndex:i]objectAtIndex:5]doubleValue];   //rot4 5
    rot5= [[[rotarray objectAtIndex:i]objectAtIndex:6]doubleValue];   //rot5 6
    rot6= [[[rotarray objectAtIndex:i]objectAtIndex:7]doubleValue];   //rot6 7
    rot7= [[[rotarray objectAtIndex:i]objectAtIndex:8]doubleValue];   //rot7 8
    rot8= [[[rotarray objectAtIndex:i]objectAtIndex:9]doubleValue];   //rot8 9
    rot9= [[[rotarray objectAtIndex:i]objectAtIndex:10]doubleValue];  //rot9 10
    rot10= [[[rotarray objectAtIndex:i]objectAtIndex:11]doubleValue];   //rot10 11
    rotTE= [[[rotarray objectAtIndex:i]objectAtIndex:12]doubleValue];   //rotTE 12
}

//----------------------------------------------------------------
- (IBAction) setDrawCoords:(id)sender {
   
    mx1= x1;
    mx2= x2;
    mx3= x3;
    mx4= x4;
    mx5= x5;
    mx6= x6;
    mx7= x7;
    mx8= x8;
    mx9= x9;
    mx10= x10;
    mx11= x11;
    mx12= x12;
    mx13= x13;
    mx14= x14;
    mx15= x15;
    mx16= x16;
    mx17= x17;
    mx18= x18;
    mx19= x19;
    mx20= x20;
    mx21= x21;
    mx22= x22;
    mx23= x23;
    mx24= x24;
    mx25= x25;
    mx26= x26;
    mx27= x27;
    mx28= x28;
    mx29= x29;
    mx30= x30;
    mx31= x31;
    mx32= x32;
    mx33= x33;
    mx34= x34;

    my1= y1;
    my2= y2;
    my3= y3;
    my4= y4;
    my5= y5;
    my6= y6;
    my7= y7;
    my8= y8;
    my9= y9;
    my10= y10;
    my11= y11;
    my12= y12;
    my13= y13;
    my14= y14;
    my15= y15;
    my16= y16;
    my17= y17;
    my18= y18;
    my19= y19;
    my20= y20;
    my21= y21;
    my22= y22;
    my23= y23;
    my24= y24;
    my25= y25;
    my26= y26;
    my27= y27;
    my28= y28;
    my29= y29;
    my30= y30;
    my31= y31;
    my32= y32;
    my33= y33;
    my34= y34;
}

//------------------------------------------------------------------
- (IBAction) RotateFin:(id)sender {
    
    finslope= (x32-x31)/(y32-y31);
    rotfin=1;
    if (finslope>0) {rotfin= -1;}
    if (finslope<0) {rotfin= 1;}
    sidea= finaxis;
    sideb= fabs(y32-y31);
    sidec= fabs(x32-x31);
    [self trianglecalc:nil];
    rotang= angac;
    
    rx1= (x1*cos(rotang*con)) - (rotfin*y1*sin(rotang*con));
    ry1= (y1*cos(rotang*con)) + (rotfin*x1*sin(rotang*con));
    rx2= (x2*cos(rotang*con)) - (rotfin*y2*sin(rotang*con));
    ry2= (y2*cos(rotang*con)) + (rotfin*x2*sin(rotang*con));
    rx3= (x3*cos(rotang*con)) - (rotfin*y3*sin(rotang*con));
    ry3= (y3*cos(rotang*con)) + (rotfin*x3*sin(rotang*con));
    rx4= (x4*cos(rotang*con)) - (rotfin*y4*sin(rotang*con));
    ry4= (y4*cos(rotang*con)) + (rotfin*x4*sin(rotang*con));
    rx5= (x5*cos(rotang*con)) - (rotfin*y5*sin(rotang*con));
    ry5= (y5*cos(rotang*con)) + (rotfin*x5*sin(rotang*con));
    rx6= (x6*cos(rotang*con)) - (rotfin*y6*sin(rotang*con));
    ry6= (y6*cos(rotang*con)) + (rotfin*x6*sin(rotang*con));
    rx7= (x7*cos(rotang*con)) - (rotfin*y7*sin(rotang*con));
    ry7= (y7*cos(rotang*con)) + (rotfin*x7*sin(rotang*con));
    rx8= (x8*cos(rotang*con)) - (rotfin*y8*sin(rotang*con));
    ry8= (y8*cos(rotang*con)) + (rotfin*x8*sin(rotang*con));
    rx9= (x9*cos(rotang*con)) - (rotfin*y9*sin(rotang*con));
    ry9= (y9*cos(rotang*con)) + (rotfin*x9*sin(rotang*con));
    rx10= (x10*cos(rotang*con)) - (rotfin*y10*sin(rotang*con));
    ry10= (y10*cos(rotang*con)) + (rotfin*x10*sin(rotang*con));
    rx11= (x11*cos(rotang*con)) - (rotfin*y11*sin(rotang*con));
    ry11= (y11*cos(rotang*con)) + (rotfin*x11*sin(rotang*con));
    rx12= (x12*cos(rotang*con)) - (rotfin*y12*sin(rotang*con));
    ry12= (y12*cos(rotang*con)) + (rotfin*x12*sin(rotang*con));
    rx13= (x13*cos(rotang*con)) - (rotfin*y13*sin(rotang*con));
    ry13= (y13*cos(rotang*con)) + (rotfin*x13*sin(rotang*con));
    rx14= (x14*cos(rotang*con)) - (rotfin*y14*sin(rotang*con));
    ry14= (y14*cos(rotang*con)) + (rotfin*x14*sin(rotang*con));
    rx15= (x15*cos(rotang*con)) - (rotfin*y15*sin(rotang*con));
    ry15= (y15*cos(rotang*con)) + (rotfin*x15*sin(rotang*con));
    rx16= (x16*cos(rotang*con)) - (rotfin*y16*sin(rotang*con));
    ry16= (y16*cos(rotang*con)) + (rotfin*x16*sin(rotang*con));
    rx17= (x17*cos(rotang*con)) - (rotfin*y17*sin(rotang*con));
    ry17= (y17*cos(rotang*con)) + (rotfin*x17*sin(rotang*con));
    rx18= (x18*cos(rotang*con)) - (rotfin*y18*sin(rotang*con));
    ry18= (y18*cos(rotang*con)) + (rotfin*x18*sin(rotang*con));
    rx19= (x19*cos(rotang*con)) - (rotfin*y19*sin(rotang*con));
    ry19= (y19*cos(rotang*con)) + (rotfin*x19*sin(rotang*con));
    rx20= (x20*cos(rotang*con)) - (rotfin*y20*sin(rotang*con));
    ry20= (y20*cos(rotang*con)) + (rotfin*x20*sin(rotang*con));
    rx21= (x21*cos(rotang*con)) - (rotfin*y21*sin(rotang*con));
    ry21= (y21*cos(rotang*con)) + (rotfin*x21*sin(rotang*con));
    rx22= (x22*cos(rotang*con)) - (rotfin*y22*sin(rotang*con));
    ry22= (y22*cos(rotang*con)) + (rotfin*x22*sin(rotang*con));
    rx23= (x23*cos(rotang*con)) - (rotfin*y23*sin(rotang*con));
    ry23= (y23*cos(rotang*con)) + (rotfin*x23*sin(rotang*con));
    rx24= (x24*cos(rotang*con)) - (rotfin*y24*sin(rotang*con));
    ry24= (y24*cos(rotang*con)) + (rotfin*x24*sin(rotang*con));
    rx25= (x25*cos(rotang*con)) - (rotfin*y25*sin(rotang*con));
    ry25= (y25*cos(rotang*con)) + (rotfin*x25*sin(rotang*con));
    rx26= (x26*cos(rotang*con)) - (rotfin*y26*sin(rotang*con));
    ry26= (y26*cos(rotang*con)) + (rotfin*x26*sin(rotang*con));
    rx27= (x27*cos(rotang*con)) - (rotfin*y27*sin(rotang*con));
    ry27= (y27*cos(rotang*con)) + (rotfin*x27*sin(rotang*con));
    rx28= (x28*cos(rotang*con)) - (rotfin*y28*sin(rotang*con));
    ry28= (y28*cos(rotang*con)) + (rotfin*x28*sin(rotang*con));
    rx29= (x29*cos(rotang*con)) - (rotfin*y29*sin(rotang*con));
    ry29= (y29*cos(rotang*con)) + (rotfin*x29*sin(rotang*con));
    rx30= (x30*cos(rotang*con)) - (rotfin*y30*sin(rotang*con));
    ry30= (y30*cos(rotang*con)) + (rotfin*x30*sin(rotang*con));
    rx31= (x31*cos(rotang*con)) - (rotfin*y31*sin(rotang*con));
    ry31= (y31*cos(rotang*con)) + (rotfin*x31*sin(rotang*con));
    rx32= (x32*cos(rotang*con)) - (rotfin*y32*sin(rotang*con));
    ry32= (y32*cos(rotang*con)) + (rotfin*x32*sin(rotang*con));
    rx33= (x33*cos(rotang*con)) - (rotfin*y33*sin(rotang*con));
    ry33= (y33*cos(rotang*con)) + (rotfin*x33*sin(rotang*con));
    rx34= (x34*cos(rotang*con)) - (rotfin*y34*sin(rotang*con));
    ry34= (y34*cos(rotang*con)) + (rotfin*x34*sin(rotang*con));
    mx1= rx1;
    mx2= rx2;
    mx3= rx3;
    mx4= rx4;
    mx5= rx5;
    mx6= rx6;
    mx7= rx7;
    mx8= rx8;
    mx9= rx9;
    mx10= rx10;
    mx11= rx11;
    mx12= rx12;
    mx13= rx13;
    mx14= rx14;
    mx15= rx15;
    mx16= rx16;
    mx17= rx17;
    mx18= rx18;
    mx19= rx19;
    mx20= rx20;
    mx21= rx21;
    mx22= rx22;
    mx23= rx23;
    mx24= rx24;
    mx25= rx25;
    mx26= rx26;
    mx27= rx27;
    mx28= rx28;
    mx29= rx29;
    mx30= rx30;
    mx31= rx31;
    mx32= rx32;
    mx33= rx33;
    mx34= rx34;
    
    my1= ry1;
    my2= ry2;
    my3= ry3;
    my4= ry4;
    my5= ry5;
    my6= ry6;
    my7= ry7;
    my8= ry8;
    my9= ry9;
    my10= ry10;
    my11= ry11;
    my12= ry12;
    my13= ry13;
    my14= ry14;
    my15= ry15;
    my16= ry16;
    my17= ry17;
    my18= ry18;
    my19= ry19;
    my20= ry20;
    my21= ry21;
    my22= ry22;
    my23= ry23;
    my24= ry24;
    my25= ry25;
    my26= ry26;
    my27= ry27;
    my28= ry28;
    my29= ry29;
    my30= ry30;
    my31= ry31;
    my32= ry32;
    my33= ry33;
    my34= ry34;
     }
//------------------------------------------------------------------
- (IBAction) SpreadFin:(id)sender {
    rotray=1;  //default for dorsal fin
    if (afin==1) {rotray= -1;}  //default rot other way for Afin
     if (rotLE!=0){
         if ([LEneg state] == NSOnState)
            if (rotLE>0){rotLE=rotLE*-1;}
         if ([LEneg state] == NSOffState)
             if (rotLE<0){rotLE=rotLE*-1;}
        rotang=rotLE;
        rx31= (x31*cos(rotang*con)) - (rotray*y31*sin(rotang*con));
        ry31= (y31*cos(rotang*con)) + (rotray*x31*sin(rotang*con));
        rx1= (x1*cos(rotang*con)) - (rotray*y1*sin(rotang*con));
        ry1= (y1*cos(rotang*con)) + (rotray*x1*sin(rotang*con));
        rx2= (x2*cos(rotang*con)) - (rotray*y2*sin(rotang*con));
        ry2= (y2*cos(rotang*con)) + (rotray*x2*sin(rotang*con));
        rx3= (x3*cos(rotang*con)) - (rotray*y3*sin(rotang*con));
        ry3= (y3*cos(rotang*con)) + (rotray*x3*sin(rotang*con));
        rx4= (x4*cos(rotang*con)) - (rotray*y4*sin(rotang*con));
        ry4= (y4*cos(rotang*con)) + (rotray*x4*sin(rotang*con));
        rx5= (x5*cos(rotang*con)) - (rotray*y5*sin(rotang*con));
        ry5= (y5*cos(rotang*con)) + (rotray*x5*sin(rotang*con));
        rx6= (x6*cos(rotang*con)) - (rotray*y6*sin(rotang*con));
        ry6= (y6*cos(rotang*con)) + (rotray*x6*sin(rotang*con));
        rx33= (x33*cos(rotang*con)) - (rotray*y33*sin(rotang*con));
        ry33= (y33*cos(rotang*con)) + (rotray*x33*sin(rotang*con));
        xhop=rx31-x31;
        yhop=ry31-y31;
        rx31= rx31-xhop;
        ry31= ry31-yhop;
        rx1= rx1-xhop;
        ry1= ry1-yhop;
        rx2= rx2-xhop;
        ry2= ry2-yhop;
        rx3= rx3-xhop;
        ry3= ry3-yhop;
        rx4= rx4-xhop;
        ry4= ry4-yhop;
        rx5= rx5-xhop;
        ry5= ry5-yhop;
        rx6= rx6-xhop;
        ry6= ry6-yhop;
        rx7= rx7-xhop;
        ry7= ry7-yhop;
        rx33= rx33-xhop;
        ry33= ry33-yhop;}
    
    if (rotLE==0) {
        rx1= x1;
        rx2= x2;
        rx3= x3;
        rx4= x4;
        rx5= x5;
        rx6= x6;
        rx7= x7;
        rx8= x8;
        rx9= x9;
        rx31= x31;
        rx33= x33;
        ry1= y1;
        ry2= y2;
        ry3= y3;
        ry4= y4;
        ry5= y5;
        ry6= y6;
        ry7= y7;
        ry8= y8;
        ry9= y9;
        ry31= y31;
        ry33= y33;}
    
//rot FinRay1
     if (rot1!=0){
         if ([R1neg state] == NSOnState)
             if (rot1>0){rot1=rot1*-1;}
         if ([R1neg state] == NSOffState)
             if (rot1<0){rot1=rot1*-1;}
        rotang=rot1;
        rx7= (x7*cos(rotang*con)) - (rotray*y7*sin(rotang*con));
        ry7= (y7*cos(rotang*con)) + (rotray*x7*sin(rotang*con));
        rx30= (x30*cos(rotang*con)) - (rotray*y30*sin(rotang*con));
        ry30= (y30*cos(rotang*con)) + (rotray*x30*sin(rotang*con));
        xhop=rx30-x30;
        yhop=ry30-y30;
        rx7= rx7-xhop;
        ry7= ry7-yhop;
        rx30= rx30-xhop;
        ry30= ry30-yhop;}
     if (rot1==0){
         rx7= x7;
         ry7= y7;
         rx30= x30;
         ry30= y30;}
    
//rot FinRay2
    if (rot2!=0){
        if ([R2neg state] == NSOnState)
            if (rot2>0){rot2=rot2*-1;}
        if ([R2neg state] == NSOffState)
            if (rot2<0){rot2=rot2*-1;}
        rotang=rot2;
        rx8= (x8*cos(rotang*con)) - (rotray*y8*sin(rotang*con));
        ry8= (y8*cos(rotang*con)) + (rotray*x8*sin(rotang*con));
        rx29= (x29*cos(rotang*con)) - (rotray*y29*sin(rotang*con));
        ry29= (y29*cos(rotang*con)) + (rotray*x29*sin(rotang*con));
        xhop=rx29-x29;
        yhop=ry29-y29;
        rx8= rx8-xhop;
        ry8= ry8-yhop;
        rx29= rx29-xhop;
        ry29= ry29-yhop;}
    if (rot2==0){
        rx8= x8;
        ry8= y8;
        rx29= x29;
        ry29= y29;}
    
//rot FinRay3
    if (rot3!=0){
        if ([R3neg state] == NSOnState)
            if (rot3>0){rot3=rot3*-1;}
        if ([R3neg state] == NSOffState)
            if (rot3<0){rot3=rot3*-1;}
        rotang=rot3;
        rx9= (x9*cos(rotang*con)) - (rotray*y9*sin(rotang*con));
        ry9= (y9*cos(rotang*con)) + (rotray*x9*sin(rotang*con));
        rx28= (x28*cos(rotang*con)) - (rotray*y28*sin(rotang*con));
        ry28= (y28*cos(rotang*con)) + (rotray*x28*sin(rotang*con));
        xhop=rx28-x28;
        yhop=ry28-y28;
        rx9= rx9-xhop;
        ry9= ry9-yhop;
        rx28= rx28-xhop;
        ry28= ry28-yhop;}
    if (rot3==0){
        rx9= x9;
        ry9= y9;
        rx28= x28;
        ry28= y28;}
    
//rot FinRay4
    if (rot4!=0){
        if ([R4neg state] == NSOnState)
            if (rot4>0){rot4=rot4*-1;}
        if ([R4neg state] == NSOffState)
            if (rot4<0){rot4=rot4*-1;}
        rotang=rot4;
        rx10= (x10*cos(rotang*con)) - (rotray*y10*sin(rotang*con));
        ry10= (y10*cos(rotang*con)) + (rotray*x10*sin(rotang*con));
        rx27= (x27*cos(rotang*con)) - (rotray*y27*sin(rotang*con));
        ry27= (y27*cos(rotang*con)) + (rotray*x27*sin(rotang*con));
        xhop=rx27-x27;
        yhop=ry27-y27;
        rx10= rx10-xhop;
        ry10= ry10-yhop;
        rx27= rx27-xhop;
        ry27= ry27-yhop;}
    if (rot4==0){
        rx10= x10;
        ry10= y10;
        rx27= x27;
        ry27= y27;}
    
//rot FinRay5
    if (rot5!=0){
        if ([R5neg state] == NSOnState)
            if (rot5>0){rot5=rot5*-1;}
        if ([R2neg state] == NSOffState)
            if (rot5<0){rot5=rot5*-1;}
        rotang=rot5;
        rx11= (x11*cos(rotang*con)) - (rotray*y11*sin(rotang*con));
        ry11= (y11*cos(rotang*con)) + (rotray*x11*sin(rotang*con));
        rx26= (x26*cos(rotang*con)) - (rotray*y26*sin(rotang*con));
        ry26= (y26*cos(rotang*con)) + (rotray*x26*sin(rotang*con));
        xhop=rx26-x26;
        yhop=ry26-y26;
        rx11= rx11-xhop;
        ry11= ry11-yhop;
        rx26= rx26-xhop;
        ry26= ry26-yhop;}
    if (rot5==0){
        rx11= x11;
        ry11= y11;
        rx26= x26;
        ry26= y26;}
    
//rot FinRay6
    if (rot6!=0){
        if ([R6neg state] == NSOnState)
            if (rot6>0){rot6=rot6*-1;}
        if ([R6neg state] == NSOffState)
            if (rot6<0){rot6=rot6*-1;}
        rotang=rot6;
        rx12= (x12*cos(rotang*con)) - (rotray*y12*sin(rotang*con));
        ry12= (y12*cos(rotang*con)) + (rotray*x12*sin(rotang*con));
        rx25= (x25*cos(rotang*con)) - (rotray*y25*sin(rotang*con));
        ry25= (y25*cos(rotang*con)) + (rotray*x25*sin(rotang*con));
        xhop=rx25-x25;
        yhop=ry25-y25;
        rx12= rx12-xhop;
        ry12= ry12-yhop;
        rx25= rx25-xhop;
        ry25= ry25-yhop;}
    if (rot6==0){
        rx12= x12;
        ry12= y12;
        rx25= x25;
        ry25= y25;}
    
    //rot FinRay7
    if (rot7!=0){
        if ([R7neg state] == NSOnState)
            if (rot7>0){rot7=rot7*-1;}
        if ([R7neg state] == NSOffState)
            if (rot7<0){rot7=rot7*-1;}
        rotang=rot7;
        rx13= (x13*cos(rotang*con)) - (rotray*y13*sin(rotang*con));
        ry13= (y13*cos(rotang*con)) + (rotray*x13*sin(rotang*con));
        rx24= (x24*cos(rotang*con)) - (rotray*y24*sin(rotang*con));
        ry24= (y24*cos(rotang*con)) + (rotray*x24*sin(rotang*con));
        xhop=rx24-x24;
        yhop=ry24-y24;
        rx13= rx13-xhop;
        ry13= ry13-yhop;
        rx24= rx24-xhop;
        ry24= ry24-yhop;}
    if (rot7==0){
        rx13= x13;
        ry13= y13;
        rx24= x24;
        ry24= y24;}
    
//rot FinRay8
    if (rot8!=0){
        if ([R8neg state] == NSOnState)
            if (rot8>0){rot8=rot8*-1;}
        if ([R8neg state] == NSOffState)
            if (rot8<0){rot8=rot8*-1;}
        rotang=rot8;
        rx14= (x14*cos(rotang*con)) - (rotray*y14*sin(rotang*con));
        ry14= (y14*cos(rotang*con)) + (rotray*x14*sin(rotang*con));
        rx23= (x23*cos(rotang*con)) - (rotray*y23*sin(rotang*con));
        ry23= (y23*cos(rotang*con)) + (rotray*x23*sin(rotang*con));
        xhop=rx23-x23;
        yhop=ry23-y23;
        rx14= rx14-xhop;
        ry14= ry14-yhop;
        rx23= rx23-xhop;
        ry23= ry23-yhop;}
    if (rot8==0){
        rx14= x14;
        ry14= y14;
        rx23= x23;
        ry23= y23;}
    
//rot FinRay9
    if (rot9!=0){
        if ([R9neg state] == NSOnState)
            if (rot9>0){rot9=rot9*-1;}
        if ([R9neg state] == NSOffState)
            if (rot9<0){rot9=rot9*-1;}
        rotang=rot9;
        rx15= (x15*cos(rotang*con)) - (rotray*y15*sin(rotang*con));
        ry15= (y15*cos(rotang*con)) + (rotray*x15*sin(rotang*con));
        rx22= (x22*cos(rotang*con)) - (rotray*y22*sin(rotang*con));
        ry22= (y22*cos(rotang*con)) + (rotray*x22*sin(rotang*con));
        xhop=rx22-x22;
        yhop=ry22-y22;
        rx15= rx15-xhop;
        ry15= ry15-yhop;
        rx22= rx22-xhop;
        ry22= ry22-yhop;}
    if (rot9==0){
        rx15= x15;
        ry15= y15;
        rx22= x22;
        ry22= y22;}
    
//rot FinRay10
    if (rot10!=0){
        if ([R10neg state] == NSOnState)
            if (rot10>0){rot10=rot10*-1;}
        if ([R10neg state] == NSOffState)
            if (rot10<0){rot10=rot10*-1;}
        rotang=rot10;
        rx16= (x16*cos(rotang*con)) - (rotray*y16*sin(rotang*con));
        ry16= (y16*cos(rotang*con)) + (rotray*x16*sin(rotang*con));
        rx21= (x21*cos(rotang*con)) - (rotray*y21*sin(rotang*con));
        ry21= (y21*cos(rotang*con)) + (rotray*x21*sin(rotang*con));
        xhop=rx21-x21;
        yhop=ry21-y21;
        rx16= rx16-xhop;
        ry16= ry16-yhop;
        rx21= rx21-xhop;
        ry21= ry21-yhop;}
    if (rot10==0){
        rx16= x16;
        ry16= y16;
        rx21= x21;
        ry21= y21;}
    
    //rot TE
    if (rotTE!=0){
        if ([TEneg state] == NSOnState)
            if (rotTE>0){rotTE=rotTE*-1;}
        if ([TEneg state] == NSOffState)
            if (rotTE<0){rotTE=rotTE*-1;}
        rotang=rotTE;
        rx32= (x32*cos(rotang*con)) - (rotray*y32*sin(rotang*con));
        ry32= (y32*cos(rotang*con)) + (rotray*x32*sin(rotang*con));
        rx17= (x17*cos(rotang*con)) - (rotray*y17*sin(rotang*con));
        ry17= (y17*cos(rotang*con)) + (rotray*x17*sin(rotang*con));
        rx18= (x18*cos(rotang*con)) - (rotray*y18*sin(rotang*con));
        ry18= (y18*cos(rotang*con)) + (rotray*x18*sin(rotang*con));
        rx19= (x19*cos(rotang*con)) - (rotray*y19*sin(rotang*con));
        ry19= (y19*cos(rotang*con)) + (rotray*x19*sin(rotang*con));
        rx20= (x20*cos(rotang*con)) - (rotray*y20*sin(rotang*con));
        ry20= (y20*cos(rotang*con)) + (rotray*x20*sin(rotang*con));
        rx34= (x34*cos(rotang*con)) - (rotray*y34*sin(rotang*con));
        ry34= (y34*cos(rotang*con)) + (rotray*x34*sin(rotang*con));
        xhop=rx32-x32;
        yhop=ry32-y32;
        rx17= rx17-xhop;
        ry17= ry17-yhop;
        rx18= rx18-xhop;
        ry18= ry18-yhop;
        rx19= rx19-xhop;
        ry19= ry19-yhop;
        rx20= rx20-xhop;
        ry20= ry20-yhop;
        rx32= rx32-xhop;
        ry32= ry32-yhop;
        rx34= rx34-xhop;
        ry34= ry34-yhop;}
    if (rotTE==0){
        rx17= x17;
        ry17= y17;
        rx18= x18;
        ry18= y18;
        rx19= x19;
        ry19= y19;
        rx20= x20;
        ry20= y20;
        rx32= x32;
        ry32= y32;
        rx34= x34;
        ry34= y34;}
    
    mx1= rx1;
    mx2= rx2;
    mx3= rx3;
    mx4= rx4;
    mx5= rx5;
    mx6= rx6;
    mx7= rx7;
    mx8= rx8;
    mx9= rx9;
    mx10= rx10;
    mx11= rx11;
    mx12= rx12;
    mx13= rx13;
    mx14= rx14;
    mx15= rx15;
    mx16= rx16;
    mx17= rx17;
    mx18= rx18;
    mx19= rx19;
    mx20= rx20;
    mx21= rx21;
    mx22= rx22;
    mx23= rx23;
    mx24= rx24;
    mx25= rx25;
    mx26= rx26;
    mx27= rx27;
    mx28= rx28;
    mx29= rx29;
    mx30= rx30;
    mx31= rx31;
    mx32= rx32;
    mx33= rx33;
    mx34= rx34;
    
    my1= ry1;
    my2= ry2;
    my3= ry3;
    my4= ry4;
    my5= ry5;
    my6= ry6;
    my7= ry7;
    my8= ry8;
    my9= ry9;
    my10= ry10;
    my11= ry11;
    my12= ry12;
    my13= ry13;
    my14= ry14;
    my15= ry15;
    my16= ry16;
    my17= ry17;
    my18= ry18;
    my19= ry19;
    my20= ry20;
    my21= ry21;
    my22= ry22;
    my23= ry23;
    my24= ry24;
    my25= ry25;
    my26= ry26;
    my27= ry27;
    my28= ry28;
    my29= ry29;
    my30= ry30;
    my31= ry31;
    my32= ry32;
    my33= ry33;
    my34= ry34;
    }
//----------------------------------------------------------------
- (IBAction) scaleUpDraw:(id)sender {
    
    mx1= mx1*scaledraw;
    mx2= mx2*scaledraw;
    mx3= mx3*scaledraw;
    mx4= mx4*scaledraw;
    mx5= mx5*scaledraw;
    mx6= mx6*scaledraw;
    mx7= mx7*scaledraw;
    mx8= mx8*scaledraw;
    mx9= mx9*scaledraw;
    mx10= mx10*scaledraw;
    mx11= mx11*scaledraw;
    mx12= mx12*scaledraw;
    mx13= mx13*scaledraw;
    mx14= mx14*scaledraw;
    mx15= mx15*scaledraw;
    mx16= mx16*scaledraw;
    mx17= mx17*scaledraw;
    mx18= mx18*scaledraw;
    mx19= mx19*scaledraw;
    mx20= mx20*scaledraw;
    mx21= mx21*scaledraw;
    mx22= mx22*scaledraw;
    mx23= mx23*scaledraw;
    mx24= mx24*scaledraw;
    mx25= mx25*scaledraw;
    mx26= mx26*scaledraw;
    mx27= mx27*scaledraw;
    mx28= mx28*scaledraw;
    mx29= mx29*scaledraw;
    mx30= mx30*scaledraw;
    mx31= mx31*scaledraw;
    mx32= mx32*scaledraw;
    mx33= mx33*scaledraw;
    mx34= mx34*scaledraw;
    
    my1= my1*scaledraw;
    my2= my2*scaledraw;
    my3= my3*scaledraw;
    my4= my4*scaledraw;
    my5= my5*scaledraw;
    my6= my6*scaledraw;
    my7= my7*scaledraw;
    my8= my8*scaledraw;
    my9= my9*scaledraw;
    my10= my10*scaledraw;
    my11= my11*scaledraw;
    my12= my12*scaledraw;
    my13= my13*scaledraw;
    my14= my14*scaledraw;
    my15= my15*scaledraw;
    my16= my16*scaledraw;
    my17= my17*scaledraw;
    my18= my18*scaledraw;
    my19= my19*scaledraw;
    my20= my20*scaledraw;
    my21= my21*scaledraw;
    my22= my22*scaledraw;
    my23= my23*scaledraw;
    my24= my24*scaledraw;
    my25= my25*scaledraw;
    my26= my26*scaledraw;
    my27= my27*scaledraw;
    my28= my28*scaledraw;
    my29= my29*scaledraw;
    my30= my30*scaledraw;
    my31= my31*scaledraw;
    my32= my32*scaledraw;
    my33= my33*scaledraw;
    my34= my34*scaledraw;
    
}

//---------------------------------------------------------------------------------
- (IBAction) scaleDrawCoords:(id)sender {

    dfinaxis= sqrt((mx32-mx31)*(mx32-mx31)+(my32-my31)*(my32-my31));
    
    if (dfinaxis<scale){
        scaledraw=1.05;
        while (dfinaxis<scale){
            [self scaleUpDraw:nil];
            dfinaxis= sqrt((mx32-mx31)*(mx32-mx31)+(my32-my31)*(my32-my31));}}
    
    if (dfinaxis>scale){
        scaledraw=0.95;
        while (dfinaxis>scale){
            [self scaleUpDraw:nil];
            dfinaxis= sqrt((mx32-mx31)*(mx32-mx31)+(my32-my31)*(my32-my31));}}
    
    dx1= xstart+floor(mx1);
    dx2= xstart+floor(mx2);
    dx3= xstart+floor(mx3);
    dx4= xstart+floor(mx4);
    dx5= xstart+floor(mx5);
    dx6= xstart+floor(mx6);
    dx7= xstart+floor(mx7);
    dx8= xstart+floor(mx8);
    dx9= xstart+floor(mx9);
    dx10= xstart+floor(mx10);
    dx11= xstart+floor(mx11);
    dx12= xstart+floor(mx12);
    dx13= xstart+floor(mx13);
    dx14= xstart+floor(mx14);
    dx15= xstart+floor(mx15);
    dx16= xstart+floor(mx16);
    dx17= xstart+floor(mx17);
    dx18= xstart+floor(mx18);
    dx19= xstart+floor(mx19);
    dx20= xstart+floor(mx20);
    dx21= xstart+floor(mx21);
    dx22= xstart+floor(mx22);
    dx23= xstart+floor(mx23);
    dx24= xstart+floor(mx24);
    dx25= xstart+floor(mx25);
    dx26= xstart+floor(mx26);
    dx27= xstart+floor(mx27);
    dx28= xstart+floor(mx28);
    dx29= xstart+floor(mx29);
    dx30= xstart+floor(mx30);
    dx31= xstart+floor(mx31);
    dx32= xstart+floor(mx32);
    dx33= xstart+floor(mx33);
    dx34= xstart+floor(mx34);
    
    dy1= ystart+floor(my1);
    dy2= ystart+floor(my2);
    dy3= ystart+floor(my3);
    dy4= ystart+floor(my4);
    dy5= ystart+floor(my5);
    dy6= ystart+floor(my6);
    dy7= ystart+floor(my7);
    dy8= ystart+floor(my8);
    dy9= ystart+floor(my9);
    dy10= ystart+floor(my10);
    dy11= ystart+floor(my11);
    dy12= ystart+floor(my12);
    dy13= ystart+floor(my13);
    dy14= ystart+floor(my14);
    dy15= ystart+floor(my15);
    dy16= ystart+floor(my16);
    dy17= ystart+floor(my17);
    dy18= ystart+floor(my18);
    dy19= ystart+floor(my19);
    dy20= ystart+floor(my20);
    dy21= ystart+floor(my21);
    dy22= ystart+floor(my22);
    dy23= ystart+floor(my23);
    dy24= ystart+floor(my24);
    dy25= ystart+floor(my25);
    dy26= ystart+floor(my26);
    dy27= ystart+floor(my27);
    dy28= ystart+floor(my28);
    dy29= ystart+floor(my29);
    dy30= ystart+floor(my30);
    dy31= ystart+floor(my31);
    dy32= ystart+floor(my32);
    dy33= ystart+floor(my33);
    dy34= ystart+floor(my34);
    
    if (dx31<xstart){
        step=2;
        while (dx31<xstart) {[self LeftRight:nil];}}
    
    if (dx31>xstart){
        step=-2;
        while (dx31>xstart) {[self LeftRight:nil];}}
    
    if (dy31<ystart){
        step=2;
        while (dy31<ystart) {[self UpDown:nil];}}
    
    if (dy31>ystart){
        step=-2;
        while (dy31>ystart) {[self UpDown:nil];}}
    
    pt[0] = NSMakePoint(0,0); 
    pt[1] = NSMakePoint(dx1,dy1);
    pt[2] = NSMakePoint(dx2,dy2);
    pt[3] = NSMakePoint(dx3,dy3);
    pt[4] = NSMakePoint(dx4,dy4);
    pt[5] = NSMakePoint(dx5,dy5);
    pt[6] = NSMakePoint(dx6,dy6);
    pt[7] = NSMakePoint(dx7,dy7);
    pt[8] = NSMakePoint(dx8,dy8);
    pt[9] = NSMakePoint(dx9,dy9);
    pt[10] = NSMakePoint(dx10,dy10);
    pt[11] = NSMakePoint(dx11,dy11);
    pt[12] = NSMakePoint(dx12,dy12);
    pt[13] = NSMakePoint(dx13,dy13);
    pt[14] = NSMakePoint(dx14,dy14);
    pt[15] = NSMakePoint(dx15,dy15);
    pt[16] = NSMakePoint(dx16,dy16);
    pt[17] = NSMakePoint(dx17,dy17);
    pt[18] = NSMakePoint(dx18,dy18);
    pt[19] = NSMakePoint(dx19,dy19);
    pt[20] = NSMakePoint(dx20,dy20);
    pt[21] = NSMakePoint(dx21,dy21);
    pt[22] = NSMakePoint(dx22,dy22);
    pt[23] = NSMakePoint(dx23,dy23);
    pt[24] = NSMakePoint(dx24,dy24);
    pt[25] = NSMakePoint(dx25,dy25);
    pt[26] = NSMakePoint(dx26,dy26);
    pt[27] = NSMakePoint(dx27,dy27);
    pt[28] = NSMakePoint(dx28,dy28);
    pt[29] = NSMakePoint(dx29,dy29);
    pt[30] = NSMakePoint(dx30,dy30);
    pt[31] = NSMakePoint(dx31,dy31);
    pt[32] = NSMakePoint(dx32,dy32);
    pt[33] = NSMakePoint(dx33,dy33);
    pt[34] = NSMakePoint(dx34,dy34);
}

//---------------------------------------------------------------------------------
- (IBAction)DrawFin:(id)sender
{
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
    
    //Points in Blue
    CGContextSetRGBStrokeColor(context, 0, 0, 255, 1);//blue
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[1]).x, NSPointToCGPoint (pt[1]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[2]).x, NSPointToCGPoint (pt[2]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[3]).x, NSPointToCGPoint (pt[3]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[4]).x, NSPointToCGPoint (pt[4]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[5]).x, NSPointToCGPoint (pt[5]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[6]).x, NSPointToCGPoint (pt[6]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[7]).x, NSPointToCGPoint (pt[7]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[8]).x, NSPointToCGPoint (pt[8]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[9]).x, NSPointToCGPoint (pt[9]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[10]).x, NSPointToCGPoint (pt[10]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[11]).x, NSPointToCGPoint (pt[11]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[12]).x, NSPointToCGPoint (pt[12]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[13]).x, NSPointToCGPoint (pt[13]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[14]).x, NSPointToCGPoint (pt[14]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[15]).x, NSPointToCGPoint (pt[15]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[16]).x, NSPointToCGPoint (pt[16]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[17]).x, NSPointToCGPoint (pt[17]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[18]).x, NSPointToCGPoint (pt[18]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[19]).x, NSPointToCGPoint (pt[19]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[20]).x, NSPointToCGPoint (pt[20]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[21]).x, NSPointToCGPoint (pt[21]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[22]).x, NSPointToCGPoint (pt[22]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[23]).x, NSPointToCGPoint (pt[23]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[24]).x, NSPointToCGPoint (pt[24]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[25]).x, NSPointToCGPoint (pt[25]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[26]).x, NSPointToCGPoint (pt[26]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[27]).x, NSPointToCGPoint (pt[27]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[28]).x, NSPointToCGPoint (pt[28]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[29]).x, NSPointToCGPoint (pt[29]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[30]).x, NSPointToCGPoint (pt[30]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[31]).x, NSPointToCGPoint (pt[31]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[32]).x, NSPointToCGPoint (pt[32]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[33]).x, NSPointToCGPoint (pt[33]).y, 3, 3));
    CGContextStrokeEllipseInRect(context, CGRectMake(NSPointToCGPoint(pt[34]).x, NSPointToCGPoint (pt[34]).y, 3, 3));
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokePath(context);
    
    //lines in black
     CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0); //Black
	//Leading Edge
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[31]).x, NSPointToCGPoint (pt[31]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[1]).x, NSPointToCGPoint (pt[1]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[2]).x, NSPointToCGPoint (pt[2]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[3]).x, NSPointToCGPoint (pt[3]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[4]).x, NSPointToCGPoint (pt[4]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[5]).x, NSPointToCGPoint (pt[5]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[6]).x, NSPointToCGPoint (pt[6]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[33]).x, NSPointToCGPoint (pt[33]).y);
    //Fin Top
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[7]).x, NSPointToCGPoint (pt[7]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[8]).x, NSPointToCGPoint (pt[8]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[9]).x, NSPointToCGPoint (pt[9]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[10]).x, NSPointToCGPoint (pt[10]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[11]).x, NSPointToCGPoint (pt[11]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[12]).x, NSPointToCGPoint (pt[12]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[13]).x, NSPointToCGPoint (pt[13]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[14]).x, NSPointToCGPoint (pt[14]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[15]).x, NSPointToCGPoint (pt[15]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[16]).x, NSPointToCGPoint (pt[16]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[34]).x, NSPointToCGPoint (pt[34]).y);
    //Trailing Edge
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[17]).x, NSPointToCGPoint (pt[17]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[18]).x, NSPointToCGPoint (pt[18]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[19]).x, NSPointToCGPoint (pt[19]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[20]).x, NSPointToCGPoint (pt[20]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[32]).x, NSPointToCGPoint (pt[32]).y);
    //Fin Base
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[21]).x, NSPointToCGPoint (pt[21]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[22]).x, NSPointToCGPoint (pt[22]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[23]).x, NSPointToCGPoint (pt[23]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[24]).x, NSPointToCGPoint (pt[24]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[25]).x, NSPointToCGPoint (pt[25]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[26]).x, NSPointToCGPoint (pt[26]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[27]).x, NSPointToCGPoint (pt[27]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[28]).x, NSPointToCGPoint (pt[28]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[29]).x, NSPointToCGPoint (pt[29]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[30]).x, NSPointToCGPoint (pt[30]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[31]).x, NSPointToCGPoint (pt[31]).y);
    
    //Fin Rays
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[30]).x, NSPointToCGPoint (pt[30]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[7]).x, NSPointToCGPoint (pt[7]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[29]).x, NSPointToCGPoint (pt[29]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[8]).x, NSPointToCGPoint (pt[8]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[28]).x, NSPointToCGPoint (pt[28]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[9]).x, NSPointToCGPoint (pt[9]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[27]).x, NSPointToCGPoint (pt[27]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[10]).x, NSPointToCGPoint (pt[10]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[26]).x, NSPointToCGPoint (pt[26]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[11]).x, NSPointToCGPoint (pt[11]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[25]).x, NSPointToCGPoint (pt[25]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[12]).x, NSPointToCGPoint (pt[12]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[24]).x, NSPointToCGPoint (pt[24]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[13]).x, NSPointToCGPoint (pt[13]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[23]).x, NSPointToCGPoint (pt[23]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[14]).x, NSPointToCGPoint (pt[14]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[22]).x, NSPointToCGPoint (pt[22]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[15]).x, NSPointToCGPoint (pt[15]).y);
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[21]).x, NSPointToCGPoint (pt[21]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[16]).x, NSPointToCGPoint (pt[16]).y);
    CGContextStrokePath(context);
   
    //FinAxis in Red
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0); //Red
    CGContextMoveToPoint(context,NSPointToCGPoint(pt[32]).x, NSPointToCGPoint (pt[32]).y);
    CGContextAddLineToPoint(context,NSPointToCGPoint(pt[31]).x, NSPointToCGPoint (pt[31]).y);
    CGContextSetLineWidth(context, 1.0);
    CGContextStrokePath(context);
}


//---------------------------------------------------------------------------------
- (IBAction)nextFin:(id)sender {
    if (i<fishcount){
        [self setRot:nil]; //store new rots before moving
        i=i+1; 
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self clearRotState:nil];  //set all rots to pos
        [self getRot:nil];  //get previously stored rots
        [self getRotState:nil];  //get previously stored rot states if neg
        [self processdata:nil];
        [self setDrawCoords:nil];
        [self scaleDrawCoords:nil];
        [self datatoscreen:nil];
        [self setNeedsDisplay:YES]; }
}
//---------------------------------------------------------------------------------
- (IBAction)prevFin:(id)sender {
    if (i>1){
        [self setRot:nil]; //store new rots before moving
        i=i-1; 
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self clearRotState:nil];  //set all rots to pos
        [self getRot:nil];  //get previously stored rots
        [self getRotState:nil];  //get previously stored rot states if neg
        [self processdata:nil];
        [self setDrawCoords:nil];
        [self scaleDrawCoords:nil];
        [self datatoscreen:nil];
        [self setNeedsDisplay:YES]; }
}

//---------------------------------------------------------------------------------
- (IBAction)magnify:(id)sender
{
    scale= scale+20;
    [self datatoscreen:nil];
    [self setNeedsDisplay:YES];}
//---------------------------------------------------------------------------------
- (IBAction)reduce:(id)sender
{
    scale= scale-20;
    [self setNeedsDisplay:YES];
}
//---------------------------------------------------------------------------------
- (IBAction)upmove:(id)sender
{
    ystart= ystart+20;
    //[self processdata1:nil];
    [self setNeedsDisplay:YES];
}
//---------------------------------------------------------------------------------
- (IBAction)downmove:(id)sender
{
    ystart= ystart-20;
    //[self processdata1:nil];
    [self setNeedsDisplay:YES];
}
//---------------------------------------------------------------------------------
- (IBAction)leftmove:(id)sender
{
    xstart= xstart-20;
    //[self processdata1:nil];
    [self setNeedsDisplay:YES];
}
//---------------------------------------------------------------------------------
- (IBAction)rightmove:(id)sender
{
    xstart= xstart+20;
    //[self processdata1:nil];
    [self setNeedsDisplay:YES];
}

//---------------------------------------------------------------------------------
// Open File, read in data, and calc everything
- (IBAction)doOpen:(id)sender {
    [self initvars:nil];
    NSString *spec, *errspec;
    NSOpenPanel *theOpenPanel = [NSOpenPanel openPanel];
    [theOpenPanel setTitle:@"Choose a Coordinate File to Open"];
    if ([theOpenPanel runModal] == NSModalResponseOK) 
    {
        //theFilePath = [theOpenPanel filename]; deprecated file identification
        NSURL *theFile = [theOpenPanel URL];
        NSString *s = [NSString stringWithContentsOfURL:theFile encoding:NSUTF8StringEncoding error:nil];
        i=0;
        NSScanner *scanner = [NSScanner scannerWithString:s];
        NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        specarray = [[NSMutableArray alloc] init];  // stores species or specimen names
        [specarray insertObject:@"zero" atIndex:0];  //position zero not used
        
        fishx = [[NSMutableArray alloc] init];
        [fishx insertObject: [NSMutableArray array] atIndex:0];//adds x array at position 0, not used
        rowx= [fishx objectAtIndex: 0];
        [rowx insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds x val at position 0, not used
        
        fishy = [[NSMutableArray alloc] init];
        [fishy insertObject: [NSMutableArray array] atIndex:0];//adds y array at position 0, not used
        rowy= [fishy objectAtIndex: 0];
        [rowy insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds y val at position 0, not used
        
        rotarray = [[NSMutableArray alloc] init];   // stores fin ray rotations
        [rotarray insertObject: [NSMutableArray array] atIndex:0];//adds array within array at position 0, not used
        rowrot= [rotarray objectAtIndex: 0];
        [rowrot insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds rot val at position 0, not used
        
        while ([scanner isAtEnd] == NO) {
            fishok = 0;
            i= i+1;
            [fishx insertObject: [NSMutableArray array] atIndex:i];//adds x array at position i
            [fishy insertObject: [NSMutableArray array] atIndex:i];//adds y array at position i
            rowx= [fishx objectAtIndex: i];          //adds x row at position i
            rowy= [fishy objectAtIndex: i];         //adds y row at position i
            [rowx insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds x val at position 0, not used
            [rowy insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds y val at position 0, not used

            [scanner scanUpToCharactersFromSet:whiteSpace intoString:&spec];//gets specimen name at start of line
            [specarray insertObject:spec atIndex:i];  //store specimen name
            [scanner scanDouble:&x1]; [rowx addObject:[NSNumber numberWithDouble:x1]];  //alternate X-Y coords
            [scanner scanDouble:&y1]; [rowy addObject:[NSNumber numberWithDouble:y1]];
            [scanner scanDouble:&x2]; [rowx addObject:[NSNumber numberWithDouble:x2]];
            [scanner scanDouble:&y2]; [rowy addObject:[NSNumber numberWithDouble:y2]];
            [scanner scanDouble:&x3]; [rowx addObject:[NSNumber numberWithDouble:x3]];
            [scanner scanDouble:&y3]; [rowy addObject:[NSNumber numberWithDouble:y3]];
            [scanner scanDouble:&x4]; [rowx addObject:[NSNumber numberWithDouble:x4]];
            [scanner scanDouble:&y4]; [rowy addObject:[NSNumber numberWithDouble:y4]];
            [scanner scanDouble:&x5]; [rowx addObject:[NSNumber numberWithDouble:x5]];
            [scanner scanDouble:&y5]; [rowy addObject:[NSNumber numberWithDouble:y5]];
            [scanner scanDouble:&x6]; [rowx addObject:[NSNumber numberWithDouble:x6]];
            [scanner scanDouble:&y6]; [rowy addObject:[NSNumber numberWithDouble:y6]];
            [scanner scanDouble:&x7]; [rowx addObject:[NSNumber numberWithDouble:x7]];
            [scanner scanDouble:&y7]; [rowy addObject:[NSNumber numberWithDouble:y7]];
            [scanner scanDouble:&x8]; [rowx addObject:[NSNumber numberWithDouble:x8]];
            [scanner scanDouble:&y8]; [rowy addObject:[NSNumber numberWithDouble:y8]];
            [scanner scanDouble:&x9]; [rowx addObject:[NSNumber numberWithDouble:x9]];
            [scanner scanDouble:&y9]; [rowy addObject:[NSNumber numberWithDouble:y9]];
            [scanner scanDouble:&x10]; [rowx addObject:[NSNumber numberWithDouble:x10]];
            [scanner scanDouble:&y10]; [rowy addObject:[NSNumber numberWithDouble:y10]];
            [scanner scanDouble:&x11]; [rowx addObject:[NSNumber numberWithDouble:x11]];
            [scanner scanDouble:&y11]; [rowy addObject:[NSNumber numberWithDouble:y11]];
            [scanner scanDouble:&x12]; [rowx addObject:[NSNumber numberWithDouble:x12]];
            [scanner scanDouble:&y12]; [rowy addObject:[NSNumber numberWithDouble:y12]];
            [scanner scanDouble:&x13]; [rowx addObject:[NSNumber numberWithDouble:x13]];
            [scanner scanDouble:&y13]; [rowy addObject:[NSNumber numberWithDouble:y13]];
            [scanner scanDouble:&x14]; [rowx addObject:[NSNumber numberWithDouble:x14]];
            [scanner scanDouble:&y14]; [rowy addObject:[NSNumber numberWithDouble:y14]];
            [scanner scanDouble:&x15]; [rowx addObject:[NSNumber numberWithDouble:x15]];
            [scanner scanDouble:&y15]; [rowy addObject:[NSNumber numberWithDouble:y15]];
            [scanner scanDouble:&x16]; [rowx addObject:[NSNumber numberWithDouble:x16]];
            [scanner scanDouble:&y16]; [rowy addObject:[NSNumber numberWithDouble:y16]];
            [scanner scanDouble:&x17]; [rowx addObject:[NSNumber numberWithDouble:x17]];
            [scanner scanDouble:&y17]; [rowy addObject:[NSNumber numberWithDouble:y17]];
            [scanner scanDouble:&x18]; [rowx addObject:[NSNumber numberWithDouble:x18]];
            [scanner scanDouble:&y18]; [rowy addObject:[NSNumber numberWithDouble:y18]];
            [scanner scanDouble:&x19]; [rowx addObject:[NSNumber numberWithDouble:x19]];
            [scanner scanDouble:&y19]; [rowy addObject:[NSNumber numberWithDouble:y19]];
            [scanner scanDouble:&x20]; [rowx addObject:[NSNumber numberWithDouble:x20]];
            [scanner scanDouble:&y20]; [rowy addObject:[NSNumber numberWithDouble:y20]];
            [scanner scanDouble:&x21]; [rowx addObject:[NSNumber numberWithDouble:x21]];
            [scanner scanDouble:&y21]; [rowy addObject:[NSNumber numberWithDouble:y21]];
            [scanner scanDouble:&x22]; [rowx addObject:[NSNumber numberWithDouble:x22]];
            [scanner scanDouble:&y22]; [rowy addObject:[NSNumber numberWithDouble:y22]];
            [scanner scanDouble:&x23]; [rowx addObject:[NSNumber numberWithDouble:x23]];
            [scanner scanDouble:&y23]; [rowy addObject:[NSNumber numberWithDouble:y23]];
            [scanner scanDouble:&x24]; [rowx addObject:[NSNumber numberWithDouble:x24]];
            [scanner scanDouble:&y24]; [rowy addObject:[NSNumber numberWithDouble:y24]];
            [scanner scanDouble:&x25]; [rowx addObject:[NSNumber numberWithDouble:x25]];
            [scanner scanDouble:&y25]; [rowy addObject:[NSNumber numberWithDouble:y25]];
            [scanner scanDouble:&x26]; [rowx addObject:[NSNumber numberWithDouble:x26]];
            [scanner scanDouble:&y26]; [rowy addObject:[NSNumber numberWithDouble:y26]];
            [scanner scanDouble:&x27]; [rowx addObject:[NSNumber numberWithDouble:x27]];
            [scanner scanDouble:&y27]; [rowy addObject:[NSNumber numberWithDouble:y27]];
            [scanner scanDouble:&x28]; [rowx addObject:[NSNumber numberWithDouble:x28]];
            [scanner scanDouble:&y28]; [rowy addObject:[NSNumber numberWithDouble:y28]];
            [scanner scanDouble:&x29]; [rowx addObject:[NSNumber numberWithDouble:x29]];
            [scanner scanDouble:&y29]; [rowy addObject:[NSNumber numberWithDouble:y29]];
            [scanner scanDouble:&x30]; [rowx addObject:[NSNumber numberWithDouble:x30]];
            [scanner scanDouble:&y30]; [rowy addObject:[NSNumber numberWithDouble:y30]];
            [scanner scanDouble:&x31]; [rowx addObject:[NSNumber numberWithDouble:x31]];
            [scanner scanDouble:&y31]; [rowy addObject:[NSNumber numberWithDouble:y31]];
            [scanner scanDouble:&x32]; [rowx addObject:[NSNumber numberWithDouble:x32]];
            [scanner scanDouble:&y32]; [rowy addObject:[NSNumber numberWithDouble:y32]];
            [scanner scanDouble:&x33]; [rowx addObject:[NSNumber numberWithDouble:x33]];
            [scanner scanDouble:&y33]; [rowy addObject:[NSNumber numberWithDouble:y33]];
            [scanner scanDouble:&x34]; [rowx addObject:[NSNumber numberWithDouble:x34]];
            [scanner scanDouble:&y34]; [rowy addObject:[NSNumber numberWithDouble:y34]];
            
            [rotarray insertObject: [NSMutableArray array] atIndex:i];
            rowrot= [rotarray objectAtIndex: i];
            [rowrot insertObject: [NSNumber numberWithDouble:0] atIndex:0];
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rotLE 1
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot1 2
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot2 3
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot3 4
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot4 5
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot5 6
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot6 7
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot7 8
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot8 9
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot9 10
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot10 11
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rotTE 12
            
           
            if (y34==0) {fishok = 1;}
            if (fishok==1) {
                errspec = [NSString stringWithFormat:@"%d", i];
                NSAlert *alert = [[NSAlert alloc] init];
                //[alert setAlertStyle:NSInformationalAlertStyle];
                [alert addButtonWithTitle:@"OK"];
                [alert setMessageText:@"Error: Reading file, number of data items in a line, in specimen #"];
                [alert setInformativeText: errspec];
                [alert runModal];}
                //[alert release];}
            fishcount=i;
        } //end if scanner is at end
        
        i=1;
        afin=0;
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self processdata:nil];
        [self setDrawCoords:nil];
        [self scaleDrawCoords:nil];
        [self DrawFin:nil];
        [self datatoscreen:nil];
        selectedSegment=0;
        [self setNeedsDisplay:YES];
    }
}

// Open File, read in data, and calc everything
- (IBAction)doOpenAnal:(id)sender {
    [self initvars:nil];
    NSString *spec, *errspec;
    NSOpenPanel *theOpenPanel = [NSOpenPanel openPanel];
    [theOpenPanel setTitle:@"Choose a Coordinate File to Open"];
    if ([theOpenPanel runModal] == NSModalResponseOK)
    {
        //theFilePath = [theOpenPanel filename]; deprecated file identification
        NSURL *theFile = [theOpenPanel URL];
        NSString *s = [NSString stringWithContentsOfURL:theFile encoding:NSUTF8StringEncoding error:nil];
        i=0;
        NSScanner *scanner = [NSScanner scannerWithString:s];
        NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        specarray = [[NSMutableArray alloc] init];  // stores species or specimen names
        [specarray insertObject:@"zero" atIndex:0];  //position zero not used
        
        fishx = [[NSMutableArray alloc] init];
        [fishx insertObject: [NSMutableArray array] atIndex:0];//adds x array at position 0, not used
        rowx= [fishx objectAtIndex: 0];
        [rowx insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds x val at position 0, not used
        
        fishy = [[NSMutableArray alloc] init];
        [fishy insertObject: [NSMutableArray array] atIndex:0];//adds y array at position 0, not used
        rowy= [fishy objectAtIndex: 0];
        [rowy insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds y val at position 0, not used
        
        rotarray = [[NSMutableArray alloc] init];   // stores fin ray rotations
        [rotarray insertObject: [NSMutableArray array] atIndex:0];//adds array within array at position 0, not used
        rowrot= [rotarray objectAtIndex: 0];
        [rowrot insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds rot val at position 0, not used
        
        while ([scanner isAtEnd] == NO) {
            fishok = 0;
            i= i+1;
            [fishx insertObject: [NSMutableArray array] atIndex:i];//adds x array at position i
            [fishy insertObject: [NSMutableArray array] atIndex:i];//adds y array at position i
            rowx= [fishx objectAtIndex: i];          //adds x row at position i
            rowy= [fishy objectAtIndex: i];         //adds y row at position i
            [rowx insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds x val at position 0, not used
            [rowy insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds y val at position 0, not used
            
            [scanner scanUpToCharactersFromSet:whiteSpace intoString:&spec];//gets specimen name at start of line
            [specarray insertObject:spec atIndex:i];  //store specimen name
            [scanner scanDouble:&x30];   //DIFFERENT ORDER FOR ANAL FIN
            [scanner scanDouble:&y30];
            [scanner scanDouble:&x29];
            [scanner scanDouble:&y29];
            [scanner scanDouble:&x28];
            [scanner scanDouble:&y28];
            [scanner scanDouble:&x27];
            [scanner scanDouble:&y27];
            [scanner scanDouble:&x26];
            [scanner scanDouble:&y26];
            [scanner scanDouble:&x25];
            [scanner scanDouble:&y25];
            [scanner scanDouble:&x24];
            [scanner scanDouble:&y24];
            [scanner scanDouble:&x23];
            [scanner scanDouble:&y23];
            [scanner scanDouble:&x22];
            [scanner scanDouble:&y22];
            [scanner scanDouble:&x21];
            [scanner scanDouble:&y21];
            [scanner scanDouble:&x20];
            [scanner scanDouble:&y20];
            [scanner scanDouble:&x19];
            [scanner scanDouble:&y19];
            [scanner scanDouble:&x18];
            [scanner scanDouble:&y18];
            [scanner scanDouble:&x17];
            [scanner scanDouble:&y17];
            [scanner scanDouble:&x16];
            [scanner scanDouble:&y16];
            [scanner scanDouble:&x15];
            [scanner scanDouble:&y15];
            [scanner scanDouble:&x14];
            [scanner scanDouble:&y14];
            [scanner scanDouble:&x13];
            [scanner scanDouble:&y13];
            [scanner scanDouble:&x12];
            [scanner scanDouble:&y12];
            [scanner scanDouble:&x11];
            [scanner scanDouble:&y11];
            [scanner scanDouble:&x10];
            [scanner scanDouble:&y10];
            [scanner scanDouble:&x9];
            [scanner scanDouble:&y9];
            [scanner scanDouble:&x8];
            [scanner scanDouble:&y8];
            [scanner scanDouble:&x7];
            [scanner scanDouble:&y7];
            [scanner scanDouble:&x6];
            [scanner scanDouble:&y6];
            [scanner scanDouble:&x5];
            [scanner scanDouble:&y5];
            [scanner scanDouble:&x4];
            [scanner scanDouble:&y4];
            [scanner scanDouble:&x3];
            [scanner scanDouble:&y3];
            [scanner scanDouble:&x2];
            [scanner scanDouble:&y2];
            [scanner scanDouble:&x1];
            [scanner scanDouble:&y1];
            [scanner scanDouble:&x32];
            [scanner scanDouble:&y32];
            [scanner scanDouble:&x31];
            [scanner scanDouble:&y31];
            [scanner scanDouble:&x34];
            [scanner scanDouble:&y34];
            [scanner scanDouble:&x33];
            [scanner scanDouble:&y33];
          
            [rowx addObject:[NSNumber numberWithDouble:x1]];
            [rowx addObject:[NSNumber numberWithDouble:x2]];
            [rowx addObject:[NSNumber numberWithDouble:x3]];
            [rowx addObject:[NSNumber numberWithDouble:x4]];
            [rowx addObject:[NSNumber numberWithDouble:x5]];
            [rowx addObject:[NSNumber numberWithDouble:x6]];
            [rowx addObject:[NSNumber numberWithDouble:x7]];
            [rowx addObject:[NSNumber numberWithDouble:x8]];
            [rowx addObject:[NSNumber numberWithDouble:x9]];
            [rowx addObject:[NSNumber numberWithDouble:x10]];
            [rowx addObject:[NSNumber numberWithDouble:x11]];
            [rowx addObject:[NSNumber numberWithDouble:x12]];
            [rowx addObject:[NSNumber numberWithDouble:x13]];
            [rowx addObject:[NSNumber numberWithDouble:x14]];
            [rowx addObject:[NSNumber numberWithDouble:x15]];
            [rowx addObject:[NSNumber numberWithDouble:x16]];
            [rowx addObject:[NSNumber numberWithDouble:x17]];
            [rowx addObject:[NSNumber numberWithDouble:x18]];
            [rowx addObject:[NSNumber numberWithDouble:x19]];
            [rowx addObject:[NSNumber numberWithDouble:x20]];
            [rowx addObject:[NSNumber numberWithDouble:x21]];
            [rowx addObject:[NSNumber numberWithDouble:x22]];
            [rowx addObject:[NSNumber numberWithDouble:x23]];
            [rowx addObject:[NSNumber numberWithDouble:x24]];
            [rowx addObject:[NSNumber numberWithDouble:x25]];
            [rowx addObject:[NSNumber numberWithDouble:x26]];
            [rowx addObject:[NSNumber numberWithDouble:x27]];
            [rowx addObject:[NSNumber numberWithDouble:x28]];
            [rowx addObject:[NSNumber numberWithDouble:x29]];
            [rowx addObject:[NSNumber numberWithDouble:x30]];
            [rowx addObject:[NSNumber numberWithDouble:x31]];
            [rowx addObject:[NSNumber numberWithDouble:x32]];
            [rowx addObject:[NSNumber numberWithDouble:x33]];
            [rowx addObject:[NSNumber numberWithDouble:x34]];
            
            [rowy addObject:[NSNumber numberWithDouble:y1]];
            [rowy addObject:[NSNumber numberWithDouble:y2]];
            [rowy addObject:[NSNumber numberWithDouble:y3]];
            [rowy addObject:[NSNumber numberWithDouble:y4]];
            [rowy addObject:[NSNumber numberWithDouble:y5]];
            [rowy addObject:[NSNumber numberWithDouble:y6]];
            [rowy addObject:[NSNumber numberWithDouble:y7]];
            [rowy addObject:[NSNumber numberWithDouble:y8]];
            [rowy addObject:[NSNumber numberWithDouble:y9]];
            [rowy addObject:[NSNumber numberWithDouble:y10]];
            [rowy addObject:[NSNumber numberWithDouble:y11]];
            [rowy addObject:[NSNumber numberWithDouble:y12]];
            [rowy addObject:[NSNumber numberWithDouble:y13]];
            [rowy addObject:[NSNumber numberWithDouble:y14]];
            [rowy addObject:[NSNumber numberWithDouble:y15]];
            [rowy addObject:[NSNumber numberWithDouble:y16]];
            [rowy addObject:[NSNumber numberWithDouble:y17]];
            [rowy addObject:[NSNumber numberWithDouble:y18]];
            [rowy addObject:[NSNumber numberWithDouble:y19]];
            [rowy addObject:[NSNumber numberWithDouble:y20]];
            [rowy addObject:[NSNumber numberWithDouble:y21]];
            [rowy addObject:[NSNumber numberWithDouble:y22]];
            [rowy addObject:[NSNumber numberWithDouble:y23]];
            [rowy addObject:[NSNumber numberWithDouble:y24]];
            [rowy addObject:[NSNumber numberWithDouble:y25]];
            [rowy addObject:[NSNumber numberWithDouble:y26]];
            [rowy addObject:[NSNumber numberWithDouble:y27]];
            [rowy addObject:[NSNumber numberWithDouble:y28]];
            [rowy addObject:[NSNumber numberWithDouble:y29]];
            [rowy addObject:[NSNumber numberWithDouble:y30]];
            [rowy addObject:[NSNumber numberWithDouble:y31]];
            [rowy addObject:[NSNumber numberWithDouble:y32]];
            [rowy addObject:[NSNumber numberWithDouble:y33]];
            [rowy addObject:[NSNumber numberWithDouble:y34]];
            
            [rotarray insertObject: [NSMutableArray array] atIndex:i];
            rowrot= [rotarray objectAtIndex: i];
            [rowrot insertObject: [NSNumber numberWithDouble:0] atIndex:0];
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rotLE 1
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot1 2
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot2 3
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot3 4
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot4 5
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot5 6
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot6 7
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot7 8
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot8 9
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot9 10
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot10 11
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rotTE 12
            
            
            if (y34==0) {fishok = 1;}
            if (fishok==1) {
                errspec = [NSString stringWithFormat:@"%d", i];
                NSAlert *alert = [[NSAlert alloc] init];
                //[alert setAlertStyle:NSInformationalAlertStyle];
                [alert addButtonWithTitle:@"OK"];
                [alert setMessageText:@"Error: Reading file, number of data items in a line, in specimen #"];
                [alert setInformativeText: errspec];
                [alert runModal];}
            //[alert release];}
            fishcount=i;
        } //end if scanner is at end
        
        i=1;
        afin=1;
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self processdata:nil];
        [self setDrawCoords:nil];
        [self scaleDrawCoords:nil];
        [self DrawFin:nil];
        [self datatoscreen:nil];
        selectedSegment=0;
        [self setNeedsDisplay:YES];
    }
}
//---------------------------------------------------------------------------------
// Save datafile.

- (IBAction)savedata:(id)sender{

    NSMutableData *header1, *header2, *header3, *header4;  //Set up file headers to give labels to columns
//Fin Metrics, lengths and areas, both raw and rotated
    const char *head1 = " Specimen LeadEdge Ray1 Ray2 Ray3 Ray4 Ray5 Ray6 Ray7 Ray8 Ray9 Ray10 TrailEdge FinAxis AreaTotal Area1 Area2 Area3 Area4 Area5 Area6 Area7 Area8 Area9 Area10 Area11 rAreaTotal rArea1 rArea2 rArea3 rArea4 rArea5 rArea6 rArea7 rArea8 rArea9 rArea10 rArea11";
    
//Spreadfin rotated coords
    const char *head2 = " Specimen x1 y1 x2 y2 x3 y3 x4 y4 x5 y5 x6 y6 x7 y7 x8 y8 x9 y9 x10 y10 x11 y11 x12 y12 x13 y13 x14 y14 x15 y15 x16 y16 x17 y17 x18 y18 x19 y19 x20 y20 x21 y21 x22 y22 x23 y23 x24 y24 x25 y25 x26 y26 x27 y27 x28 y28 x29 y29 x30 y30 x31 y31 x32 y32 x33 y33 x34 y34 ";
    
//Rotated flat fin base coords
    const char *head3 = " Specimen x1 y1 x2 y2 x3 y3 x4 y4 x5 y5 x6 y6 x7 y7 x8 y8 x9 y9 x10 y10 x11 y11 x12 y12 x13 y13 x14 y14 x15 y15 x16 y16 x17 y17 x18 y18 x19 y19 x20 y20 x21 y21 x22 y22 x23 y23 x24 y24 x25 y25 x26 y26 x27 y27 x28 y28 x29 y29 x30 y30 x31 y31 x32 y32 x33 y33 x34 y34 ";
    
//Fin Ray user rotation record
    const char *head4 = " Specimen LeadEdgeRot Ray1Rot Ray2Rot Ray3Rot Ray4Rot Ray5Rot Ray6Rot Ray7Rot Ray8Rot Ray9Rot Ray10Rot TrailEdgeRot";
    
    header1 = [NSMutableData dataWithBytes:head1 length:strlen(head1)];
    header2 = [NSMutableData dataWithBytes:head2 length:strlen(head2)];
    header3 = [NSMutableData dataWithBytes:head3 length:strlen(head3)];
    header4 = [NSMutableData dataWithBytes:head4 length:strlen(head4)];

    //Puts all the files on the desktop
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES); //create array, store documents directory
    NSString *desktopPath = [paths objectAtIndex:0]; //hold path to desktop directory
    
//Fin Metrics, lengths and areas- both raw and rotated
    NSString *outFilePath1 = [desktopPath stringByAppendingPathComponent:@"FinMetrics.txt"];  //write the first file of fin metrics
    [header1 writeToFile:outFilePath1 atomically:YES]; //puts the column headers in first row
    NSFileHandle *fileHandle1 = [NSFileHandle fileHandleForWritingAtPath:outFilePath1];
    [fileHandle1 seekToEndOfFile];
    i=0;
    while (i<fishcount) {
        i=i+1;
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self clearRotState:nil];  //set all rots to pos
        [self getRot:nil];  //get previously stored rots
        [self getRotState:nil];  //get previously stored rot states if neg
        [self SpreadFin:nil];
        [self processdata:nil];
        NSString *FinMetrics = [NSString stringWithFormat:@"\r\n %@ %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f %1.4f", [specarray objectAtIndex: i], leadedge, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, trailedge, finaxis, areatotal, area1, area2, area3, area4, area5, area6, area7, area8, area9, area10, area11, rareatotal, rarea1, rarea2, rarea3, rarea4, rarea5, rarea6, rarea7, rarea8, rarea9, rarea10, rarea11];// 38 vars
            [fileHandle1 writeData:[FinMetrics dataUsingEncoding:NSUTF8StringEncoding]];
        }
     [fileHandle1 closeFile];
    
//Spreadfin rotated coords
    NSString *outFilePath2 = [desktopPath stringByAppendingPathComponent:@"DorsalFinSpreadCoords.txt"];
    [header2 writeToFile:outFilePath2 atomically:YES];
    NSFileHandle *fileHandle2 = [NSFileHandle fileHandleForWritingAtPath:outFilePath2];
    [fileHandle2 seekToEndOfFile];
    NSString *outFilePath5 = [desktopPath stringByAppendingPathComponent:@"AnalFinSpreadCoords.txt"];
    [header2 writeToFile:outFilePath5 atomically:YES];
    NSFileHandle *fileHandle5 = [NSFileHandle fileHandleForWritingAtPath:outFilePath5];
    [fileHandle5 seekToEndOfFile];
    i=0;
    while (i<fishcount) {
        i=i+1;
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self clearRotState:nil];  //set all rots to pos
        [self getRot:nil];  //get previously stored rots
        [self getRotState:nil];  //get previously stored rot states if neg
        [self SpreadFin:nil];
        [self processdata:nil];
        if (afin==0) {
        NSString *NewFinCoords = [NSString stringWithFormat:@"\r\n %@ %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f", [specarray objectAtIndex: i], rx1, ry1, rx2, ry2, rx3, ry3, rx4, ry4, rx5, ry5, rx6, ry6, rx7, ry7, rx8, ry8, rx9, ry9, rx10, ry10, rx11, ry11, rx12, ry12, rx13, ry13, rx14, ry14, rx15, ry15, rx16, ry16, rx17, ry17, rx18, ry18, rx19, ry19, rx20, ry20, rx21, ry21, rx22, ry22, rx23, ry23, rx24, ry24, rx25, ry25, rx26, ry26, rx27, ry27, rx28, ry28, rx29, ry29, rx30, ry30, rx31, ry31, rx32, ry32, rx33, ry33, rx34, ry34];
            [fileHandle2 writeData:[NewFinCoords dataUsingEncoding:NSUTF8StringEncoding]];}
        
        if (afin==1) {
        NSString *NewFinCoords = [NSString stringWithFormat:@"\r\n %@ %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f", [specarray objectAtIndex: i], rx30, ry30, rx29, ry29, rx28, ry28, rx27, ry27, rx26, ry26, rx25, ry25, rx24, ry24, rx23, ry23, rx22, ry22, rx21, ry21, rx20, ry20, rx19, ry19, rx18, ry18, rx17, ry17, rx16, ry16, rx15, ry15, rx14, ry14, rx13, ry13, rx12, ry12, rx11, ry11, rx10, ry10, rx9, ry9, rx8, ry8, rx7, ry7, rx6, ry6, rx5, ry5, rx4, ry4, rx3, ry3, rx2, ry2, rx1, ry1, rx32, ry32, rx31, ry31, rx34, ry34, rx33, ry33];
            [fileHandle5 writeData:[NewFinCoords dataUsingEncoding:NSUTF8StringEncoding]];}
        
    }
    [fileHandle2 closeFile];
    
    //Rotated flat fin base coords
    NSString *outFilePath3 = [desktopPath stringByAppendingPathComponent:@"FinFlatCoords.txt"];
    [header3 writeToFile:outFilePath3 atomically:YES];
    NSFileHandle *fileHandle3 = [NSFileHandle fileHandleForWritingAtPath:outFilePath3];
    [fileHandle3 seekToEndOfFile];
    i=0;
    while (i<fishcount) {
        i=i+1;
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self RotateFin:nil];
        [self processdata:nil];
        NSString *FlatFinCoords = [NSString stringWithFormat:@"\r\n %@ %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f", [specarray objectAtIndex: i], rx1, rx2, rx3, rx4, rx5, rx6, rx7, rx8, rx9, rx10, rx11, rx12, rx13, rx14, rx15, rx16, rx17, rx18, rx19, rx20, rx21, rx22, rx23, rx24, rx25, rx26, rx27, rx28, rx29, rx30, rx31, rx32, rx33, rx34, ry1, ry2, ry3, ry4, ry5, ry6, ry7, ry8, ry9, ry10, ry11, ry12, ry13, ry14, ry15, ry16, ry17, ry18, ry19, ry20, ry21, ry22, ry23, ry24, ry25, ry26, ry27, ry28, ry29, ry30, ry31, ry32, ry33, ry34];
        [fileHandle3 writeData:[FlatFinCoords dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle3 closeFile];
    
    //Fin Rot records
    NSString *outFilePath4 = [desktopPath stringByAppendingPathComponent:@"FinRots.txt"];
    [header4 writeToFile:outFilePath4 atomically:YES];
    NSFileHandle *fileHandle4 = [NSFileHandle fileHandleForWritingAtPath:outFilePath4];
    [fileHandle4 seekToEndOfFile];
    i=0;
    while (i<fishcount) {
        i=i+1;
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self SpreadFin:nil];
        [self processdata:nil];
        NSString *FinRots = [NSString stringWithFormat:@"\r\n %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", [specarray objectAtIndex: i], [[rotarray objectAtIndex:i] objectAtIndex:1], [[rotarray objectAtIndex:i] objectAtIndex:2], [[rotarray objectAtIndex:i] objectAtIndex:3], [[rotarray objectAtIndex:i] objectAtIndex:4], [[rotarray objectAtIndex:i] objectAtIndex:5], [[rotarray objectAtIndex:i] objectAtIndex:6], [[rotarray objectAtIndex:i] objectAtIndex:7], [[rotarray objectAtIndex:i] objectAtIndex:8], [[rotarray objectAtIndex:i] objectAtIndex:9], [[rotarray objectAtIndex:i] objectAtIndex:10], [[rotarray objectAtIndex:i]objectAtIndex:11], [[rotarray objectAtIndex:i]objectAtIndex:12]];
        [fileHandle4 writeData:[FinRots dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle4 closeFile];
    
    NSAlert *alert = [[NSAlert alloc] init];
    //[alert setAlertStyle:NSInformationalAlertStyle];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:@"File Save"];
    [alert setInformativeText:@"Files Saved With App or on Desktop"];
    [alert runModal];
    //[alert release];
}


//---------------------------------------------------------------------------------

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    sleep(1);
}

//---------------------------------------------------------------------------------
- (IBAction)changeSegment:(id)sender
{
	selectedSegment = [sender selectedSegment];
    [self setNeedsDisplay:YES];
}

//---------------------------------------------------------------------------------
- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        //Load up a sample data file
        NSString *spec;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DorsalFin" ofType:@"txt"];
        NSString *s = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        i=0;
        NSScanner *scanner = [NSScanner scannerWithString:s];
        NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        specarray = [[NSMutableArray alloc] init];
        [specarray insertObject:@"zero" atIndex:0];  //position zero not used
        
        fishx = [[NSMutableArray alloc] init];
        [fishx insertObject: [NSMutableArray array] atIndex:0];//adds x array at position 0, not used
        rowx= [fishx objectAtIndex: 0];
        [rowx insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds x val at position 0, not used
        
        fishy = [[NSMutableArray alloc] init];
        [fishy insertObject: [NSMutableArray array] atIndex:0];//adds y array at position 0, not used
        rowy= [fishy objectAtIndex: 0];
        [rowy insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds y val at position 0, not used
        
        rotarray = [[NSMutableArray alloc] init];   // stores fin ray rotations
        [rotarray insertObject: [NSMutableArray array] atIndex:0];//adds array within array at position 0, not used
        rowrot= [rotarray objectAtIndex: 0];
        [rowrot insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds rot val at position 0, not used
        while ([scanner isAtEnd] == NO) {
            fishok = 0;
            i= i+1;
            [fishx insertObject: [NSMutableArray array] atIndex:i];//adds x array at position i
            [fishy insertObject: [NSMutableArray array] atIndex:i];//adds y array at position i
            rowx= [fishx objectAtIndex: i];          //adds x row at position i
            rowy= [fishy objectAtIndex: i];         //adds y row at position i
            [rowx insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds x val at position 0, not used
            [rowy insertObject: [NSNumber numberWithDouble:0] atIndex:0];//adds y val at position 0, not used
           
            [scanner scanUpToCharactersFromSet:whiteSpace intoString:&spec];//gets specimen name at start of line
            [specarray insertObject:spec atIndex:i];  //store specimen name
            [scanner scanDouble:&x1]; [rowx addObject:[NSNumber numberWithDouble:x1]];  //alternate X-Y coords
            [scanner scanDouble:&y1]; [rowy addObject:[NSNumber numberWithDouble:y1]];
            [scanner scanDouble:&x2]; [rowx addObject:[NSNumber numberWithDouble:x2]];
            [scanner scanDouble:&y2]; [rowy addObject:[NSNumber numberWithDouble:y2]];
            [scanner scanDouble:&x3]; [rowx addObject:[NSNumber numberWithDouble:x3]];
            [scanner scanDouble:&y3]; [rowy addObject:[NSNumber numberWithDouble:y3]];
            [scanner scanDouble:&x4]; [rowx addObject:[NSNumber numberWithDouble:x4]];
            [scanner scanDouble:&y4]; [rowy addObject:[NSNumber numberWithDouble:y4]];
            [scanner scanDouble:&x5]; [rowx addObject:[NSNumber numberWithDouble:x5]];
            [scanner scanDouble:&y5]; [rowy addObject:[NSNumber numberWithDouble:y5]];
            [scanner scanDouble:&x6]; [rowx addObject:[NSNumber numberWithDouble:x6]];
            [scanner scanDouble:&y6]; [rowy addObject:[NSNumber numberWithDouble:y6]];
            [scanner scanDouble:&x7]; [rowx addObject:[NSNumber numberWithDouble:x7]];
            [scanner scanDouble:&y7]; [rowy addObject:[NSNumber numberWithDouble:y7]];
            [scanner scanDouble:&x8]; [rowx addObject:[NSNumber numberWithDouble:x8]];
            [scanner scanDouble:&y8]; [rowy addObject:[NSNumber numberWithDouble:y8]];
            [scanner scanDouble:&x9]; [rowx addObject:[NSNumber numberWithDouble:x9]];
            [scanner scanDouble:&y9]; [rowy addObject:[NSNumber numberWithDouble:y9]];
            [scanner scanDouble:&x10]; [rowx addObject:[NSNumber numberWithDouble:x10]];
            [scanner scanDouble:&y10]; [rowy addObject:[NSNumber numberWithDouble:y10]];
            [scanner scanDouble:&x11]; [rowx addObject:[NSNumber numberWithDouble:x11]];
            [scanner scanDouble:&y11]; [rowy addObject:[NSNumber numberWithDouble:y11]];
            [scanner scanDouble:&x12]; [rowx addObject:[NSNumber numberWithDouble:x12]];
            [scanner scanDouble:&y12]; [rowy addObject:[NSNumber numberWithDouble:y12]];
            [scanner scanDouble:&x13]; [rowx addObject:[NSNumber numberWithDouble:x13]];
            [scanner scanDouble:&y13]; [rowy addObject:[NSNumber numberWithDouble:y13]];
            [scanner scanDouble:&x14]; [rowx addObject:[NSNumber numberWithDouble:x14]];
            [scanner scanDouble:&y14]; [rowy addObject:[NSNumber numberWithDouble:y14]];
            [scanner scanDouble:&x15]; [rowx addObject:[NSNumber numberWithDouble:x15]];
            [scanner scanDouble:&y15]; [rowy addObject:[NSNumber numberWithDouble:y15]];
            [scanner scanDouble:&x16]; [rowx addObject:[NSNumber numberWithDouble:x16]];
            [scanner scanDouble:&y16]; [rowy addObject:[NSNumber numberWithDouble:y16]];
            [scanner scanDouble:&x17]; [rowx addObject:[NSNumber numberWithDouble:x17]];
            [scanner scanDouble:&y17]; [rowy addObject:[NSNumber numberWithDouble:y17]];
            [scanner scanDouble:&x18]; [rowx addObject:[NSNumber numberWithDouble:x18]];
            [scanner scanDouble:&y18]; [rowy addObject:[NSNumber numberWithDouble:y18]];
            [scanner scanDouble:&x19]; [rowx addObject:[NSNumber numberWithDouble:x19]];
            [scanner scanDouble:&y19]; [rowy addObject:[NSNumber numberWithDouble:y19]];
            [scanner scanDouble:&x20]; [rowx addObject:[NSNumber numberWithDouble:x20]];
            [scanner scanDouble:&y20]; [rowy addObject:[NSNumber numberWithDouble:y20]];
            [scanner scanDouble:&x21]; [rowx addObject:[NSNumber numberWithDouble:x21]];
            [scanner scanDouble:&y21]; [rowy addObject:[NSNumber numberWithDouble:y21]];
            [scanner scanDouble:&x22]; [rowx addObject:[NSNumber numberWithDouble:x22]];
            [scanner scanDouble:&y22]; [rowy addObject:[NSNumber numberWithDouble:y22]];
            [scanner scanDouble:&x23]; [rowx addObject:[NSNumber numberWithDouble:x23]];
            [scanner scanDouble:&y23]; [rowy addObject:[NSNumber numberWithDouble:y23]];
            [scanner scanDouble:&x24]; [rowx addObject:[NSNumber numberWithDouble:x24]];
            [scanner scanDouble:&y24]; [rowy addObject:[NSNumber numberWithDouble:y24]];
            [scanner scanDouble:&x25]; [rowx addObject:[NSNumber numberWithDouble:x25]];
            [scanner scanDouble:&y25]; [rowy addObject:[NSNumber numberWithDouble:y25]];
            [scanner scanDouble:&x26]; [rowx addObject:[NSNumber numberWithDouble:x26]];
            [scanner scanDouble:&y26]; [rowy addObject:[NSNumber numberWithDouble:y26]];
            [scanner scanDouble:&x27]; [rowx addObject:[NSNumber numberWithDouble:x27]];
            [scanner scanDouble:&y27]; [rowy addObject:[NSNumber numberWithDouble:y27]];
            [scanner scanDouble:&x28]; [rowx addObject:[NSNumber numberWithDouble:x28]];
            [scanner scanDouble:&y28]; [rowy addObject:[NSNumber numberWithDouble:y28]];
            [scanner scanDouble:&x29]; [rowx addObject:[NSNumber numberWithDouble:x29]];
            [scanner scanDouble:&y29]; [rowy addObject:[NSNumber numberWithDouble:y29]];
            [scanner scanDouble:&x30]; [rowx addObject:[NSNumber numberWithDouble:x30]];
            [scanner scanDouble:&y30]; [rowy addObject:[NSNumber numberWithDouble:y30]];
            [scanner scanDouble:&x31]; [rowx addObject:[NSNumber numberWithDouble:x31]];
            [scanner scanDouble:&y31]; [rowy addObject:[NSNumber numberWithDouble:y31]];
            [scanner scanDouble:&x32]; [rowx addObject:[NSNumber numberWithDouble:x32]];
            [scanner scanDouble:&y32]; [rowy addObject:[NSNumber numberWithDouble:y32]];
            [scanner scanDouble:&x33]; [rowx addObject:[NSNumber numberWithDouble:x33]];
            [scanner scanDouble:&y33]; [rowy addObject:[NSNumber numberWithDouble:y33]];
            [scanner scanDouble:&x34]; [rowx addObject:[NSNumber numberWithDouble:x34]];
            [scanner scanDouble:&y34]; [rowy addObject:[NSNumber numberWithDouble:y34]];
            
            [rotarray insertObject: [NSMutableArray array] atIndex:i];
            rowrot= [rotarray objectAtIndex: i];
            [rowrot insertObject: [NSNumber numberWithDouble:0] atIndex:0];
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rotLE 1
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot1 2
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot2 3
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot3 4
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot4 5
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot5 6
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot6 7
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot7 8
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot8 9
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot9 10
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rot10 11
            [rowrot addObject:[NSNumber numberWithDouble:0]];  //rotTE 12
            fishcount=i;
              } //end if scanner is at end
        i=1;
        [self initvars:nil];
        [self CoordsFromArray:nil];
        [self calclinks:nil];
        [self processdata:nil];
        [self setDrawCoords:nil];
        [self scaleDrawCoords:nil];
        [self DrawFin:nil];
        [self datatoscreen:nil];
        selectedSegment=0;
        [self setNeedsDisplay:YES];
         
    }
    return self;
}
//---------------------------------------------------------------------------------

 - (void)drawRect:(NSRect)Rect
{
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
	// Draw the background as a white square framed in black
	NSRect nsBounds = [self bounds];
	CGRect cgBounds = NSRectToCGRect(nsBounds);
	CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
	CGContextFillRect(context, cgBounds);
	CGContextSetRGBFillColor(context, 0, 0, 0, 1.0);
	CGContextSetLineWidth(context, 1.0);
	CGContextStrokeRect(context, cgBounds);
    [self setNeedsDisplay:YES];
        
    switch (selectedSegment)
	{
		case 0:         //DrawRaw
            [self CoordsFromArray:nil];
            [self calclinks:nil];
            [self processdata:nil];
            //[self InsertNewCoords:nil];
            [self setDrawCoords:nil];
            [self scaleDrawCoords:nil];
            [self DrawFin:nil];
            [self datatoscreen:nil];
            [self setNeedsDisplay:YES];
            selectedSegment=0;
        break;
            
		case 1:         //Draw rotated flat
            [self CoordsFromArray:nil];
            [self calclinks:nil];
            [self RotateFin:nil];  //also sets the DrawCoords
            [self processdata:nil];
            [self scaleDrawCoords:nil];
            [self DrawFin:nil];
            [self datatoscreen:nil];
            [self setNeedsDisplay:YES];
            selectedSegment=1;
        break;
            
        case 2:     //Draw SpreadFin with rays rotated
            [self CoordsFromArray:nil];
            [self calclinks:nil];
            [self SpreadFin:nil];
            [self processdata:nil];
            [self scaleDrawCoords:nil];
            [self DrawFin:nil];
            [self datatoscreen:nil];
            [self setNeedsDisplay:YES];
            selectedSegment=2;
           
        break;
        
    }    //end switch selected segment
    
}    // end drawrect

//---------------------------------------------------------------------------------
- (void)dealloc
{
   // [super dealloc];
}

@end



