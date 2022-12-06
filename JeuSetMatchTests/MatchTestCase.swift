//
//  MatchTestCase.swift
//  JeuSetMatchTests
//
//  Created by Stephane Lefebvre on 12/3/22.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

final class MatchTestCase: XCTestCase {
    var match: Match!

    override func setUp() {
        super.setUp()
        match = Match()
    }

    private func createSet(wonByPlayer player: Player) -> JeuSetMatch.Set {
        let set = Set()
        createManyGames(6, wonByPlayer: player, inSet: set)
        return set
    }

    private func createManyGames(_ count: Int, wonByPlayer player: Player, inSet set: JeuSetMatch.Set) {
        for _ in 1...count {
            let game = Game()
            game.winner = player
            set.games.append(game)
        }
    }

    func createManySets(_ count: Int, wonnByPlayer player: Player) {
        for _ in 1...count {
            let set = createSet(wonByPlayer: player)
            match.sets.append(set)
        }
    }

    func testGivenCurrentGameScoreIs40andAndSetScoreIs6To6_WhenPointIsAdded_ThenTieBreakGameIsCreated() {
        createManyGames(5, wonByPlayer: .one, inSet: match.sets.last!)
        createManyGames(6, wonByPlayer: .two, inSet: match.sets.last!)
        match.sets.last?.games.append(Game())
        match.currentGame.scores[.one] = 40

        match.pointEnded(wonBy: .one)

        XCTAssert(match.currentGame is TieBreakGame)
    }
}
