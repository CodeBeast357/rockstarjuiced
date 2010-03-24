//
//  TeamList.m
//  NavApp
//
//  Created by alex on 18/03/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TeamList.h"

static TeamList *instance = nil;

@implementation TeamList

+ (TeamList*)getInstance {
	@synchronized(self) {
		if (instance == nil) {
			instance = [[TeamList alloc] init];
		}
	}
	return instance;
}

- (TeamList*)init {
	if (self = [super init]) {
		
		list = [[NSMutableArray alloc] init];
		
		// Initialisation
		Team *teamNJD= [[Team alloc] init];
		teamNJD.teamTown=@"New Jersey";
		teamNJD.townAbbreviation=@"NJD";
		teamNJD.teamName=@"Devils";
		[self addTeam:teamNJD];
		[teamNJD release];
		
		
		
		Team *teamCHI= [[Team alloc] init];
		teamCHI.teamTown=@"Chicago";
		teamCHI.townAbbreviation=@"CHI";
		teamCHI.teamName=@"Blackhawks";
		[self addTeam:teamCHI];
		[teamCHI release];
		
		Team *teamNYI= [[Team alloc] init];
		teamNYI.teamTown=@"New York";
		teamNYI.townAbbreviation=@"NYI";
		teamNYI.teamName=@"Islanders";
		[self addTeam:teamNYI];
		[teamNYI release];
		
		Team *teamCOB= [[Team alloc] init];
		teamCOB.teamTown=@"Colombus";
		teamCOB.townAbbreviation=@"COB";
		teamCOB.teamName=@"Blue Jackets";
		[self addTeam:teamCOB];
		[teamCOB release];
		
		Team *teamNYR= [[Team alloc] init];
		teamNYR.teamTown=@"New York";
		teamNYR.townAbbreviation=@"NYR";
		teamNYR.teamName=@"Rangers";
		[self addTeam:teamNYR];
		[teamNYR release];
		
		Team *teamDET= [[Team alloc] init];
		teamDET.teamTown=@"Detroit";
		teamDET.townAbbreviation=@"DET";
		teamDET.teamName=@"Red Wings";
		[self addTeam:teamDET];
		[teamDET release];
		
		Team *teamPHI= [[Team alloc] init];
		teamPHI.teamTown=@"Philadelphia";
		teamPHI.townAbbreviation=@"PHI";
		teamPHI.teamName=@"Flyers";
		[self addTeam:teamPHI];
		[teamPHI release];
		
		Team *teamNAS= [[Team alloc] init];
		teamNAS.teamTown=@"Nashville";
		teamNAS.townAbbreviation=@"NAS";
		teamNAS.teamName=@"Predators";
		[self addTeam:teamNAS];
		[teamNAS release];
		
		Team *teamPIT= [[Team alloc] init];
		teamPIT.teamTown=@"Pittsburgh";
		teamPIT.townAbbreviation=@"PIT";
		teamPIT.teamName=@"Penguins";
		[self addTeam:teamPIT];
		[teamPIT release];
		
		Team *teamSTL= [[Team alloc] init];
		teamSTL.teamTown=@"St Louis";
		teamSTL.townAbbreviation=@"STL";
		teamSTL.teamName=@"Blues";
		[self addTeam:teamSTL];
		[teamSTL release];
		
		Team *teamBOS= [[Team alloc] init];
		teamBOS.teamTown=@"Boston";
		teamBOS.townAbbreviation=@"BOS";
		teamBOS.teamName=@"Bruins";
		[self addTeam:teamBOS];
		[teamBOS release];
		
		Team *teamCGY= [[Team alloc] init];
		teamCGY.teamTown=@"Calgary";
		teamCGY.townAbbreviation=@"CGY";
		teamCGY.teamName=@"Flames";
		[self addTeam:teamCGY];
		[teamCGY release];
		
		Team *teamBUF=[[Team alloc] init];
		teamBUF.teamTown=@"Buffalo";
		teamBUF.townAbbreviation=@"BUF";
		teamBUF.teamName=@"Sabres";
		[self addTeam:teamBUF];
		[teamBUF release];
		
		Team *teamCOL=[[Team alloc] init];
		teamCOL.teamTown=@"Colorado";
		teamCOL.townAbbreviation=@"COL";
		teamCOL.teamName=@"Avalanche";
		[self addTeam:teamCOL];
		[teamCOL release];
		
		Team *teamMON= [[Team alloc] init];
		teamMON.teamTown=@"Montreal";
		teamMON.townAbbreviation=@"MON";
		teamMON.teamName=@"Canadiens";
		[self addTeam:teamMON];
		[teamMON release];
		
		Team *teamEDM= [[Team alloc] init];
		teamEDM.teamTown=@"Edmonton";
		teamEDM.townAbbreviation=@"EDM";
		teamEDM.teamName=@"Oilers";
		[self addTeam:teamEDM];
		[teamEDM release];
		
		Team *teamOTT= [[Team alloc] init];
		teamOTT.teamTown=@"Ottawa";
		teamOTT.townAbbreviation=@"OTT";
		teamOTT.teamName=@"Senators";
		[self addTeam:teamOTT];
		[teamOTT release];
		
		Team *teamMIN= [[Team alloc] init];
		teamMIN.teamTown=@"Minnesota";
		teamMIN.townAbbreviation=@"MIN";
		teamMIN.teamName=@"Wild";
		[self addTeam:teamMIN];
		[teamMIN release];
		
		Team *teamTOR= [[Team alloc] init];
		teamTOR.teamTown=@"Torronto";
		teamTOR.townAbbreviation=@"TOR";
		teamTOR.teamName=@"Maple Leafs";
		[self addTeam:teamTOR];
		[teamTOR release];
		
		Team *teamVAN= [[Team alloc] init];
		teamVAN.teamTown=@"Vancouver";
		teamVAN.townAbbreviation=@"VAN";
		teamVAN.teamName=@"Canucks";
		[self addTeam:teamVAN];
		//[teamVAN release];
		
		Team *teamATL= [[Team alloc] init];
		teamATL.teamTown=@"Atlanta";
		teamATL.townAbbreviation=@"ATL";
		teamATL.teamName=@"Thrashers";
		[self addTeam:teamATL];
		[teamATL release];
		
		Team *teamANA= [[Team alloc] init];
		teamANA.teamTown=@"Anaheim";
		teamANA.townAbbreviation=@"ANA";
		teamANA.teamName=@"Ducks";
		[self addTeam:teamANA];
		[teamANA release];
		
		Team *teamCAR= [[Team alloc] init];
		teamCAR.teamTown=@"Carolina";
		teamCAR.townAbbreviation=@"CAR";
		teamCAR.teamName=@"Hurricanes";
		[self addTeam:teamCAR];
		[teamCAR release];
		
		Team *teamDAL= [[Team alloc] init];
		teamDAL.teamTown=@"Dallas";
		teamDAL.townAbbreviation=@"DAL";
		teamDAL.teamName=@"Stars";
		[self addTeam:teamDAL];
		[teamDAL release];
		
		Team *teamFLA= [[Team alloc] init];
		teamFLA.teamTown=@"Florida";
		teamFLA.townAbbreviation=@"FLA";
		teamFLA.teamName=@"Panthers";
		[self addTeam:teamFLA];
		[teamFLA release];
		
		Team *teamLOS= [[Team alloc] init];
		teamLOS.teamTown=@"Los Angeles";
		teamLOS.townAbbreviation=@"LOS";
		teamLOS.teamName=@"Kings";
		[self addTeam:teamLOS];
		[teamLOS release];
		
		Team *teamTAM= [[Team alloc] init];
		teamTAM.teamTown=@"Tampa Bay";
		teamTAM.townAbbreviation=@"TAM";
		teamTAM.teamName=@"Lightning";
		[self addTeam:teamTAM];
		[teamTAM release];
		
		Team *teamPHO= [[Team alloc] init];
		teamPHO.teamTown=@"Phoenix";
		teamPHO.townAbbreviation=@"PHO";
		teamPHO.teamName=@"Coyotes";
		[self addTeam:teamPHO];
		[teamPHO release];
		
		Team *teamWAS=[[Team alloc] init];
		teamWAS.teamTown=@"Washington";
		teamWAS.townAbbreviation=@"WAS";
		teamWAS.teamName=@"Capitals";
		[self addTeam:teamWAS];
		[teamWAS release];
		
		Team *teamSAN= [[Team alloc] init];
		teamSAN.teamTown=@"San Jose";
		teamSAN.townAbbreviation=@"SAN";
		teamSAN.teamName=@"Sharks";
		[self addTeam:teamSAN];
		[teamSAN release];
		
	}
	return self;
}

- (void) addGoalieByTeam: (Goalie*)inputGoalie team:(NSString *)inputTeam
{
	for( Team *team in list){
		if([[team townAbbreviation] isEqualToString:inputTeam]){
			[team addGoalie:inputGoalie];
		}
	}
}

- (void) addSkaterByTeam: (Skater*)inputPlayer team:(NSString *)inputTeam
{
	for( Team *team in list){
		if([[team townAbbreviation] isEqualToString:inputTeam]){
			[team addSkater:inputPlayer];
		}
	}
}

- (NSMutableArray*) listOfTeam {
	return list;
}

- (void) addTeam: (Team*)input
{
	[list addObject: input];
}

@end
