//
//  TieBrakeGameTestCase.swift
//  JeuSetMatchTests
//
//  Created by Stephane Lefebvre on 12/4/22.
//  Copyright © 2022 OpenClassrooms. All rights reserved.
//

import XCTest
@testable import JeuSetMatch

final class TieBreakGameTestCase: XCTestCase {
    var tieBreakGame: TieBreakGame!

    override func setUp() {
        super.setUp()
        tieBreakGame = TieBreakGame()
    }

    func testGivenScoreIs0_XhenIncrementingScore_ThenScoreIs1() {
        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 1)
        }

    func testGivenScoreIs6_WhenIncrementingScore_ThenScoireIs7AndGameIsOver() {
          tieBreakGame.scores[.one] = 6

          tieBreakGame.incrementScore(forPlayer: .one)

          XCTAssertEqual(tieBreakGame.scores[.one], 7)
          XCTAssertTrue(tieBreakGame.isOver)
      }

    func testGivenScoreIs6To6_WhenIcreamentingScore_ThenScoreIsAt7to6AndGameIsNotOver() {
        tieBreakGame.scores[.one] = 6
        tieBreakGame.scores[.two] = 6

        tieBreakGame.incrementScore(forPlayer: .one)

        XCTAssertEqual(tieBreakGame.scores[.one], 7)
        XCTAssertEqual(tieBreakGame.scores[.two], 6)
        XCTAssertFalse(tieBreakGame.isOver)
    }
}
