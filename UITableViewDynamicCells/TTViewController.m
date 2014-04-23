//
//  TTViewController.m
//  UITableViewDynamicCells
//
//  Created by sergey on 4/21/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"
#import "TTObject.h"
#import "TTStudent.h"


static NSString* firstNames[] = {
    @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};

static NSString* lastNames[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
};

typedef enum {
    TTStudentGood,
    TTStudentNormal,
    TTStudentBad
} TTStudentType;

static int namesCount = 50;

@interface TTViewController ()

@property (nonatomic,strong) NSMutableArray *arrayColor;
@property (nonatomic,strong) NSMutableArray *student;
@property (nonatomic,strong) NSArray *studentType;

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    Ученик.
//    
//    1. Создайте таблицу которая содержит 1000 разных ячеек.
//    2. для каждой ячейки генирируйте радномный цвет.
//    3. RGB данные пишите в тексте ячейки, например: RGB(10,20,255)
//    4. Также раскрашивайте текст ячейки этим цветом.
//    
//    Студент.
//    
//    5. Теперь создайте класс, который содержит цвет и нейм.
//    6. В viewDidLoad сгенерируйте 1000 объектов такого класса по принципу из ученика
//    7. Положите их в массив и отобразите в таблице
//    8. В этом случае когда вы будете листать назад вы увидете те же ячейки, что там и были, а не новые рандомные
//    
//    Мастер.
//    
//    9. Возвращаемся к слудентам. Сгенерируйте 20-30 разных студентов.
//    10. В таблице создавайте не дефаулт ячейку а Value1. В этом случае у вас появится еще одна UILabel - detailLabel.
//    11. В textLabel пишите имя и фамилию студента, а в detailLabel его средний бал.
//    12. Если средний бал низкий - окрашивайте имя студента в красный цвет
//    13. Отсортируйте студентов в алфовитном порядке и отобразите в таблице
//    
//    Супермен.
//    
//    14. Средний бал для студентов ставьте рандомно от 2 до 5
//    15. После того, как вы сгенерировали 30 студентов вам надо их разбить на группы:
//    отличники, хорошисты, троечники и двоечники
//    16. Каждая группа это секция с соответствующим названием.
//    17. Студенты внутри своих групп должны быть в алфовитном порядке
//    18. Отобразите группы студентов с их оченками в таблице.
//    
//    Mission Impossible!
//    
//    19. Добавьте к супермену еще одну секцию, в которой вы отобразите 10 моделей цветов из задания Студент.
//    20. Помните, это должно быть 2 разных типа ячеек Value1 для студентов и Default для цветов.
    
    self.student = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 50; i++) {
        
        TTStudent *studentObj = [[TTStudent alloc]init];
        
        studentObj.firstName = firstNames[arc4random() % namesCount];
        studentObj.secondName = lastNames[arc4random() % namesCount];
        studentObj.averageScore = arc4random_uniform(11) + 2;
        
        [self.student addObject:studentObj];
        
    }
    
    self.arrayColor = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 10; i++) {
        
        TTObject *obj = [[TTObject alloc]init];
        
        CGFloat r = (CGFloat)(arc4random() % 256) / 255;
        CGFloat g = (CGFloat)(arc4random() % 256) / 255;
        CGFloat b = (CGFloat)(arc4random() % 256) / 255;
        
        NSString *name = [NSString stringWithFormat:@"RGB {%f,%f,%f}",r,g,b];
        UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1.f];
        
        obj.name = name;
        obj.color = color;
        
        [self.arrayColor addObject:obj];
        
    }
    
    
    NSArray *sortedObj = [self.student sortedArrayUsingComparator: ^(id a1, id a2) {

        return [[(TTStudent *)a1 firstName] compare:[(TTStudent *)a2 firstName]];
        
    }];
    
    self.student = [NSMutableArray arrayWithArray:sortedObj];
    self.studentType = [NSArray arrayWithObjects:@"Good Student",@"Normal Student",@"Bad Student",@"Color", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSArray *)countOfStudentType:(TTStudentType)type {
    
    NSIndexSet *set = [self.student indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj averageScore] >= 10 && type == TTStudentGood) {
            return YES;
        } else if ([obj averageScore] <= 6 && type == TTStudentBad) {
            return YES;
        } else if (type == TTStudentNormal && [obj averageScore] > 6 && [obj averageScore] < 10) {
            return YES;
        }
        return NO;
    }];
    
    NSArray *arrayOfType = [self.student objectsAtIndexes:set];
    
    return arrayOfType;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.studentType objectAtIndex:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.studentType count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self.arrayColor count];
    if (section == TTStudentGood) {
        return [[self countOfStudentType:TTStudentGood] count];
    } if (section == TTStudentNormal) {
        return [[self countOfStudentType:TTStudentNormal] count];
    } else if (section == TTStudentBad) {
        return [[self countOfStudentType:TTStudentBad] count];
    } else {
        return [self.arrayColor count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    static NSString *identifierColor = @"cellColor";
    
    UITableViewCell *cellColor = [tableView dequeueReusableCellWithIdentifier:identifierColor];
    
    if (indexPath.section == 3) {
        
        if (!cellColor) {
            cellColor = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierColor];
        }
        
    } else {
    
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
    }

    cell.textLabel.font = [UIFont fontWithName:nil size:12];
    cell.detailTextLabel.font = [UIFont fontWithName:nil size:12];
    
    
    if (indexPath.section == 3) {
        
        TTObject *obj = [self.arrayColor objectAtIndex:indexPath.row];
        cellColor.textLabel.text = obj.name;
        cellColor.backgroundColor = obj.color;
        cellColor.textLabel.font = [UIFont fontWithName:nil size:12];
        
        return cellColor;
        
    } else {
        
        
    NSArray *student = [self countOfStudentType:(TTStudentType)indexPath.section];

    
    TTStudent *studetObj = [student objectAtIndex:indexPath.row];
    
    if (studetObj.averageScore >= 10) {
        cell.backgroundColor = [UIColor greenColor];
    } else if (studetObj.averageScore <= 6) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor orangeColor];
    }
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%g",studetObj.averageScore];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",studetObj.firstName ,studetObj.secondName];
    
        return cell;
    }
    
    return nil;
}

@end
