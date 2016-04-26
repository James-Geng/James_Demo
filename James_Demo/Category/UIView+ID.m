//
//  UIView+AddDropShadow.m
//  FWD
//
//  Created by SSDIP0001 on 27/3/14.
//  Copyright (c) 2014 HelloWorld. All rights reserved.
//
//  This category patches UIView and adds utility functions to it

#import "UIView+ID.h"

@implementation UIView (IDou)
- (void) addDropShadow {
    self.backgroundColor=[UIColor whiteColor];
    self.layer.borderColor=RGB(204,204,204).CGColor;
//    self.layer.borderWidth=0.3;
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowRadius = 0.25;
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)] CGPath];
}

//- (NSString*) getSaveValue {
//    if ([self respondsToSelector:@selector(text)]) {
//        return [self performSelector:@selector(text)];
//    } else if ([self respondsToSelector:@selector(selectedValue)]) {
//        return [self performSelector:@selector(selectedValue)];
//    } else if ([self isKindOfClass:[CTCheckbox class]]) {
//        return [(CTCheckbox*)self checked]?@"yes":@"no";
//    } else if ([self isKindOfClass:[FWDTextField class]]) {
//        return ((FWDTextField*)self).textField.text;
//    } else {
//        [NSException raise:@"Invalid class" format:@"No handler to handle object of class %@",NSStringFromClass(self.class)];
//    }
//    
//    return nil;
//}

/*
 updateToDictionary: Update values of specified views to dictionary
 Input: dictionary(NSMutableDictionary) - dictionary to store values
        fields(NSDictionary) - Mappings of stored name and view in NSString*:NSView* pairs
        choiceMappings(NSDictionary, can be nil) - Mappings of choices for RadioButton and CTCheckbox in NSString*(key in fields):@[NSString*,NSString*,...], for CTCheckBox checked is index 0, unchecked is 1
 Output: none
 */
/*
- (void)updateToDictionary:(NSMutableDictionary *)dictionary fields:(NSDictionary *)fields choiceMappings:(NSDictionary *)choiceMappings {
    NSString* value;
    UIView* view;
    
    for (NSString* key in fields.keyEnumerator) {
        view=fields[key];
        if (view!=nil) {
            // NSLog(@"%s: writing %@ for %@",__FUNCTION__,key,NSStringFromClass(view.class));
            value=nil;
            
            if ([view isKindOfClass:[FWDTextField class]]) {
                value=((FWDTextField*)view).textField.text;
            } else if ([view isKindOfClass:[RadioButton class]]) {
                value=choiceMappings[key][((RadioButton*)view).selectedButton.tag];
            } else if ([view isKindOfClass:[CTCheckbox class]]) {
                value=choiceMappings[key][((CTCheckbox*)view).checked?1:0];
            } else if ([view isKindOfClass:[UITextField class]]) {
                value=((UITextField*)view).text;
            } else if ([view isKindOfClass:[UIDatePickerButton class]]) {
                value=((UIDatePickerButton*)view).selectedValue;
            } else if ([view isKindOfClass:[UIDropDownList class]]) {
                value=((UIDatePickerButton*)view).selectedValue;
            } else {
                [NSException raise:@"Invalid class" format:@"No handler to handle object of class %@",NSStringFromClass(view.class)];
            }
            
            if (value!=nil) {
                dictionary[key]=value;
            } else {
                NSLog(@"%s: warning - not saving null-value for key %@",__FUNCTION__,key);
            }
        }
    }
}

/*
 updateFromDictionary: Update values of specified views from dictionary
 Input: dictionary(NSMutableDictionary) - dictionary to read values
 fields(NSDictionary) - Mappings of stored name and view in NSString*:NSView* pairs
 choiceMappings(NSDictionary, can be nil) - Mappings of choices for RadioButton and CTCheckbox in NSString*(key in fields):@[NSString*,NSString*,...], for CTCheckBox checked is index 0, unchecked is 1
 Output: none
 /*
- (void)updateFromDictionary:(NSDictionary *)dictionary fields:(NSDictionary *)fields choiceMappings:(NSDictionary *)choiceMappings {
    UIView* view;
    
    for (NSString* key in fields.keyEnumerator) {
        view=fields[key];
        NSLog(@"%s: read %@ to %@",__FUNCTION__,key,NSStringFromClass(view.class));
        if (view!=nil && dictionary[key]!=nil) {
            if ([view isKindOfClass:[FWDTextField class]]) {
                ((FWDTextField*)view).textField.text=dictionary[key];
            } else if ([view isKindOfClass:[RadioButton class]]) {
                ((RadioButton*)((RadioButton*)view).groupButtons[[choiceMappings[key] indexOfObject:dictionary[key]]]).selected=YES;
            } else if ([view isKindOfClass:[CTCheckbox class]]) {
                ((CTCheckbox*)view).checked=[choiceMappings[key] indexOfObject:dictionary[key]]==0?NO:YES;
            } else if ([view isKindOfClass:[UITextField class]]) {
                ((UITextField*)view).text=dictionary[key];
            } else if ([view isKindOfClass:[UIDatePickerButton class]]) {
                ((UIDatePickerButton*)view).title=dictionary[key];
                ((UIDatePickerButton*)view).selectedValue=dictionary[key];
            } else if ([view isKindOfClass:[UIDropDownList class]]) {
                ((UIDatePickerButton*)view).title=dictionary[key];
                ((UIDatePickerButton*)view).selectedValue=dictionary[key];
            } else {
                [NSException raise:@"Invalid class" format:@"No handler to handle object of class %@",NSStringFromClass(view.class)];
            }
        }
    }
}

- (void)populateLongDetailsWithMappings: (NSArray*) mappings {
    UIView* view2;
    
    [self addDropShadow];
    
    int yy=0; //SNPaddingY;
    
    UILabel* label;
    
    for (NSArray* mapping in mappings.objectEnumerator) {
        yy+=SNPaddingY;
        
        if (yy!=SNPaddingY) {
            view2=[[UIView alloc] initWithFrame:CGRectMake(0, yy, self.width, 1)];
            view2.backgroundColor=[UIColor lightGrayColor];
            [self addSubview:view2];
            yy+=1+SNPaddingY;
        }
        
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(SNPaddingY, yy, self.width-2*SNPaddingY, 0)];
        [label setBoldSmallFontPreset];
        label.text=mapping[0];
        [self addSubview:label];
        
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(130, yy, self.width-130-SNPaddingY, 0)];
        [label setSmallFontPreset];
        label.textColor=GRAY_COLOR;
        label.text=((NSString*)mapping[1]).length==0?@"-":mapping[1];
        [self addSubview:label];
        
        yy+=label.height;
    }
    yy+=SNPaddingY;
    
    self.height=yy;
}

- (void)populateLongDetailsWithFields: (NSDictionary*) fields mappings: (NSArray*) mappings {
    UIView* view2;
    
    [self addDropShadow];
    
    int yy=0; //SNPaddingY;
    
    UILabel* label;
    NSString* value;
    
    for (NSArray* mapping in mappings.objectEnumerator) {
        yy+=SNPaddingY;
        
        if (yy!=SNPaddingY) {
            view2=[[UIView alloc] initWithFrame:CGRectMake(0, yy, self.width, 1)];
            view2.backgroundColor=[UIColor lightGrayColor];
            [self addSubview:view2];
            yy+=1+SNPaddingY;
        }
        
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(SNPaddingY, yy, self.width-2*SNPaddingY, 0)];
        [label setBoldSmallFontPreset];
        label.text=(NSString*)mapping[1];
        [self addSubview:label];
        
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(130, yy, self.width-130-SNPaddingY, 0)];
        [label setSmallFontPreset];
        label.textColor=GRAY_COLOR;
        label.text=((value=fields[mapping[0]])==nil?@"-":value);
        [self addSubview:label];
        
        yy+=label.height;
    }
    yy+=SNPaddingY;
    
    self.height=yy;
}

- (void)populateShortDetailsWithFields: (NSDictionary*) fields mappings: (NSArray*) mappings {
    [self addDropShadow];
    self.layer.shadowOpacity=0;
    
    int yy=SNPaddingY;
    
    UILabel* label;
    
    for (NSArray* mapping in mappings.objectEnumerator) {
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(SNPaddingY, yy, self.width-2*SNPaddingY, 0)];
        [label setBoldSmallFontPreset];
        label.text=(NSString*)mapping[1];
        [self addSubview:label];
        
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(130, yy, self.width-130-2*SNPaddingY, 0)];
        [label setSmallFontPreset];
        label.textColor=GRAY_COLOR;
        label.text=fields[mapping[0]];
        [self addSubview:label];
        
        yy+=label.height+SNPaddingX;
    }
    
    yy+=label.height+SNPaddingX;
    
    self.height=yy;
}

- (void)populateShortDetailsWithMappings: (NSArray*) mappings {
    [self addDropShadow];
    self.layer.shadowOpacity=0;
    
    int yy=SNPaddingY;
    
    UILabel* label;
    
    for (NSArray* mapping in mappings) {
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(SNPaddingY, yy, self.width-2*SNPaddingY, 0)];
        [label setBoldSmallFontPreset];
        label.text=(NSString*)mapping[0];
        [self addSubview:label];
        
        label=[[UIAutoHeightLabel alloc] initWithFrame:CGRectMake(130, yy, self.width-130-2*SNPaddingY, 0)];
        [label setSmallFontPreset];
        label.textColor=GRAY_COLOR;
        label.text=mapping[1];
        [self addSubview:label];
        
        yy+=label.height+SNPaddingX;
    }
    
    yy+=label.height+SNPaddingX;
    
    self.height=yy;
}

- (BOOL) checkEmptyFields: (NSArray*) fields {
    NSString* str;
    BOOL ret=YES;
    
    for (UIView* field in fields) {
        str=nil;
        
        if ([field respondsToSelector:@selector(text)]) {
            str=[field performSelector:@selector(text)];
        } else if ([field respondsToSelector:@selector(selectedValue)]) {
            str=[field performSelector:@selector(selectedValue)];
        } else if ([field isKindOfClass:[FWDTextField class]]) {
            str=((FWDTextField*)field).textField.text;
        } else {
            [NSException raise:@"Invalid class" format:@"Unknown text field for %@",NSStringFromClass(field.class)];
        }
        
        if (!ret) break;
    }
    
    if (!ret) {
        [[[FWDAlertView alloc] initWithTitle:LString(@"Error") message:LString(@"All required fields must be filled!") delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    
    return ret;
}
*/

@end
