//
//  GameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Stephane Lefebvre on 12/3/22.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

final class GameTestCase: XCTestCase {
    var game: Game!

    override func setUp() {
        super.setUp()
        game = Game()
    }

    func setPlayerOneScore(_ score: Int) {
        game.scores[.one] = score
    }
    
    func setPlayerTwoScore(_ score: Int) {
        game.scores[.two] = score
    }

    func testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifyeen() {
        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 15)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsFifteen_WhenIncrementingPlayer1Score_ThenScoreShouldBeThirty() {
        setPlayerOneScore(15)
        game.incrementScore(forPlayer: .one)

        XCTAssert(game.scores[.one]! == 30)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsThirty_WhenIncrementingPlayer1Score_ThenScoreShouldBeForty() {
        setPlayerOneScore(30)
        game.incrementScore(forPlayer: .one)
        XCTAssert(game.scores[.one]! == 40)
        XCTAssert(game.scores[.two]! == 0)
    }

    func testGivenScoreIsForty_WhenIncrementingPlayer1Score_TenGameIsOverAndWonByPlayerOne() {
        setPlayerOneScore(40)
        game.incrementScore(forPlayer: .one)
        XCTAssertEqual(game.winner, .one)
        XCTAssertTrue(game.isOver)
    }

    func testGivenScoreIs40to40_WhenIncrementingPlayer1Score_ThenPlayer1HasAdvantage() {
        setPlayerOneScore(40)
        setPlayerTwoScore(40)

        game.incrementScore(forPlayer: .one)

        XCTAssertEqual(game.playerWithAdvantage, .one)
        XCTAssertFalse(game.isOver)
    }
}
