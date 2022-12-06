//
//  setTestCase.swift
//  JeuSetMatchTests
//
//  Created by Stephane Lefebvre on 12/5/22.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

final class SetTestCase: XCTestCase {
    var set = Set()

    override func setUp() {
        super.setUp()
        set = Set()
    }

    func createManyGames(_ count: Int, wonByPlayer player: Player) {
        for _ in 1...count {
            let game = Game()
            game.winner = player
            set.games.append(game)
        }
    }

    func testGivenPlayerWindsByThreeGamesToTwo_WhenGettingScoreFromSet_ThenScoreShouldBeThreeToTwo() {
        createManyGames(2, wonByPlayer: .one)
        createManyGames(3, wonByPlayer: .two)

        XCTAssertEqual(set.scores[.one], 2)
        XCTAssertEqual(set.scores[.two], 3)
    }

    func testGivenSetIsNotOver_WhenGettingWinner_AnswerShoudBeNil() {
        XCTAssertNil(set.winner)
    }

    func testGivenPlayerOneWonSixGames_WhenGettingWinner_AnswerShouldBePlayerOne() {
        createManyGames(6, wonByPlayer: .one)

        XCTAssertEqual(set.winner, .one)
        XCTAssertTrue(set.isOver)
    }

    func testGivenScoreIs6To5_WhenGettingWinner_ThebThereIsNoWinnerAndSetIsNotOver() {
        createManyGames(6, wonByPlayer: .one)
        createManyGames(5, wonByPlayer: .two)

        XCTAssertNil(set.winner)
        XCTAssertFalse(set.isOver)
    }

    func testGivenScoreIs7To6_WhenGettingWinner_ThebWinnerIsPlayer1() {
        createManyGames(7, wonByPlayer: .one)
        createManyGames(6, wonByPlayer: .two)

        XCTAssertEqual(set.winner, .one)
        XCTAssertTrue(set.isOver)
    }
}
