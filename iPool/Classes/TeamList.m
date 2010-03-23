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
		

		// Initialisation
		Team *teamNJD= [[Team alloc] init];
		[teamNJD setTeamTown:@"New Jersey"];
		[teamNJD setTownAbbreviation:@"NJD"];
		[teamNJD setTeamName:@"Devils"];
		[self addTeam:teamNJD];
		
		
		
		Team *teamCHI= [Team init];
		[teamCHI setTeamTown:@"Chicago"];
		[teamCHI setTownAbbreviation:@"CHI"];
		[teamCHI setTeamName:@"Blackhawks"];
		[self addTeam:teamCHI];
		
		Team *teamNYI= [Team init];
		[teamNYI setTeamTown:@"New York"];
		[teamNYI setTownAbbreviation:@"NYI"];
		[teamNYI setTeamName:@"Islanders"];
		[self addTeam:teamNYI];
		
		Team *teamCOB= [Team init];
		[teamCOB setTeamTown:@"Colombus"];
		[teamCOB setTownAbbreviation:@"COB"];
		[teamCOB setTeamName:@"Blue Jackets"];
		[self addTeam:teamCOB];
		
		Team *teamNYR= [Team init];
		[teamNYR setTeamTown:@"New York"];
		[teamNYR setTownAbbreviation:@"NYR"];
		[teamNYR setTeamName:@"Rangers"];
		[self addTeam:teamNYR];
		
		Team *teamDET= [Team init];
		[teamDET setTeamTown:@"Detroit"];
		[teamDET setTownAbbreviation:@"DET"];
		[teamDET setTeamName:@"Red Wings"];
		[self addTeam:teamDET];
		
		Team *teamPHI= [Team init];
		[teamPHI setTeamTown:@"Philadelphia"];
		[teamPHI setTownAbbreviation:@"PHI"];
		[teamPHI setTeamName:@"Flyers"];
		[self addTeam:teamPHI];
		
		Team *teamNAS= [Team init];
		[teamNAS setTeamTown:@"Nashville"];
		[teamNAS setTownAbbreviation:@"NAS"];
		[teamNAS setTeamName:@"Predators"];
		[self addTeam:teamNAS];
		
		Team *teamPIT= [Team init];
		[teamPIT setTeamTown:@"Pittsburgh"];
		[teamPIT setTownAbbreviation:@"PIT"];
		[teamPIT setTeamName:@"Penguins"];
		[self addTeam:teamPIT];
		
		Team *teamSTL= [Team init];
		[teamSTL setTeamTown:@"St Louis"];
		[teamSTL setTownAbbreviation:@"STL"];
		[teamSTL setTeamName:@"Blues"];
		[self addTeam:teamSTL];
		
		Team *teamBOS= [Team init];
		[teamBOS setTeamTown:@"Boston"];
		[teamBOS setTownAbbreviation:@"BOS"];
		[teamBOS setTeamName:@"Bruins"];
		[self addTeam:teamBOS];
		
		Team *teamCGY= [Team init];
		[teamCGY setTeamTown:@"Calgary"];
		[teamCGY setTownAbbreviation:@"CGY"];
		[teamCGY setTeamName:@"Flames"];
		[self addTeam:teamCGY];
		
		Team *teamBUF= [Team init];
		[teamBUF setTeamTown:@"Buffalo"];
		[teamBUF setTownAbbreviation:@"BUF"];
		[teamBUF setTeamName:@"Sabres"];
		[self addTeam:teamBUF];
		
		Team *teamCOL= [Team init];
		[teamCOL setTeamTown:@"Colorado"];
		[teamCOL setTownAbbreviation:@"COL"];
		[teamCOL setTeamName:@"Avalanche"];
		[self addTeam:teamCOL];
		
		Team *teamMON= [Team init];
		[teamMON setTeamTown:@"Montreal"];
		[teamMON setTownAbbreviation:@"MON"];
		[teamMON setTeamName:@"Canadiens"];
		[self addTeam:teamMON];
		
		Team *teamEDM= [Team init];
		[teamEDM setTeamTown:@"Edmonton"];
		[teamEDM setTownAbbreviation:@"EDM"];
		[teamEDM setTeamName:@"Oilers"];
		[self addTeam:teamEDM];
		
		Team *teamOTT= [Team init];
		[teamOTT setTeamTown:@"Ottawa"];
		[teamOTT setTownAbbreviation:@"OTT"];
		[teamOTT setTeamName:@"Senators"];
		[self addTeam:teamOTT];
		
		Team *teamMIN= [Team init];
		[teamMIN setTeamTown:@"Minnesota"];
		[teamMIN setTownAbbreviation:@"MIN"];
		[teamMIN setTeamName:@"Wild"];
		[self addTeam:teamMIN];
		
		Team *teamTOR= [Team init];
		[teamTOR setTeamTown:@"Torronto"];
		[teamTOR setTownAbbreviation:@"TOR"];
		[teamTOR setTeamName:@"Maple Leafs"];
		[self addTeam:teamTOR];
		
		Team *teamVAN= [Team init];
		[teamVAN setTeamTown:@"Vancouver"];
		[teamVAN setTownAbbreviation:@"VAN"];
		[teamVAN setTeamName:@"Canucks"];
		[self addTeam:teamVAN];
		
		Team *teamATL= [Team init];
		[teamATL setTeamTown:@"Atlanta"];
		[teamATL setTownAbbreviation:@"ATL"];
		[teamATL setTeamName:@"Thrashers"];
		[self addTeam:teamATL];
		
		Team *teamANA= [Team init];
		[teamANA setTeamTown:@"Anaheim"];
		[teamANA setTownAbbreviation:@"ANA"];
		[teamANA setTeamName:@"Ducks"];
		[self addTeam:teamANA];
		
		Team *teamCAR= [Team init];
		[teamCAR setTeamTown:@"Carolina"];
		[teamCAR setTownAbbreviation:@"CAR"];
		[teamCAR setTeamName:@"Hurricanes"];
		[self addTeam:teamCAR];
		
		Team *teamDAL= [Team init];
		[teamDAL setTeamTown:@"Dallas"];
		[teamDAL setTownAbbreviation:@"DAL"];
		[teamDAL setTeamName:@"Stars"];
		[self addTeam:teamDAL];
		
		Team *teamFLA= [Team init];
		[teamFLA setTeamTown:@"Florida"];
		[teamFLA setTownAbbreviation:@"FLA"];
		[teamFLA setTeamName:@"Panthers"];
		[self addTeam:teamFLA];
		
		Team *teamLOS= [Team init];
		[teamLOS setTeamTown:@"Los Angeles"];
		[teamLOS setTownAbbreviation:@"LOS"];
		[teamLOS setTeamName:@"Kings"];
		[self addTeam:teamLOS];
		
		Team *teamTAM= [Team init];
		[teamTAM setTeamTown:@"Tampa Bay"];
		[teamTAM setTownAbbreviation:@"TAM"];
		[teamTAM setTeamName:@"Lightning"];
		[self addTeam:teamTAM];
		
		Team *teamPHO= [Team init];
		[teamPHO setTeamTown:@"Phoenix"];
		[teamPHO setTownAbbreviation:@"PHO"];
		[teamPHO setTeamName:@"Coyotes"];
		[self addTeam:teamPHO];
		
		Team *teamWAS= [Team init];
		[teamWAS setTeamTown:@"Washington"];
		[teamWAS setTownAbbreviation:@"WAS"];
		[teamWAS setTeamName:@"Capitals"];
		[self addTeam:teamWAS];
		
		Team *teamSAN= [Team init];
		[teamSAN setTeamTown:@"San Jose"];
		[teamSAN setTownAbbreviation:@"SAN"];
		[teamSAN setTeamName:@"Sharks"];
		[self addTeam:teamSAN];
 
	}
	return self;
}

- (void) addGoalieByTeam: (Goalie*)inputGoalie team:(NSString *)inputTeam
{
	for( Team *team in teamList){
		if([[team townAbbreviation] isEqualToString:inputTeam]){
			[team addGoalie:inputGoalie];
		}
	}
}

- (void) addSkaterByTeam: (Skater*)inputPlayer team:(NSString *)inputTeam
{
	for( Team *team in teamList){
		if([[team townAbbreviation] isEqualToString:inputTeam]){
			[team addSkater:inputPlayer];
		}
	}
}

- (NSMutableArray*) teamList {
	return teamList;
}

- (void) addTeam: (Team*)input
{
	[teamList addObject: input];
}

@end
