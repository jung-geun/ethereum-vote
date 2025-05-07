// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract VotingContract {
  // 후보자 구성. votesReceived[후보자] = 투표 수
  mapping (string => uint256) public votesReceived;
  // 후보자 목록. string[] = 후보자 이름
  string[] public candidateList;
  // 투표 여부 확인. hasVoted[투표자 주소] = true/false. 지갑 주소가 투표했는지 확인
  mapping (address => bool) public hasVoted;

  // 생성자. 후보자 목록을 초기화 - 단순화된 버전
  constructor(string[] memory candidateNames) {
    // 배열 직접 할당 대신 빈 배열로 시작
    // 후보자가 없어도 배포는 성공하도록 수정
    for (uint i = 0; i < candidateNames.length; i++) {
      // 후보자 이름이 비어있지 않은 경우에만 추가
      if (bytes(candidateNames[i]).length > 0) {
        candidateList.push(candidateNames[i]);
      }
    }
  }

  function voteForCandidate(string memory candidate) public {
    // 투표 여부 확인
    require(!hasVoted[msg.sender], unicode"이미 투표했습니다.");
    
    // 후보자 존재 여부 확인
    bool validCandidate = false;
    for (uint i = 0; i < candidateList.length; i++) {
      if (keccak256(bytes(candidateList[i])) == keccak256(bytes(candidate))) {
        validCandidate = true;
        break;
      }
    }
    require(validCandidate, unicode"후보자가 존재하지 않습니다.");
    // 투표 수 증가
    votesReceived[candidate] += 1;
    // 투표 완료 처리
    hasVoted[msg.sender] = true;
  }

  function totalVotesFor(string memory candidate) public view returns (uint256) {
    // 후보자의 투표 수를 반환
    require(votesReceived[candidate] >= 0, unicode"후보자가 존재하지 않습니다.");
    return votesReceived[candidate];
  }

  function getCandidateList() public view returns (string[] memory) {
    return candidateList;
  }
}
