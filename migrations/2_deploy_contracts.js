const VotingContract = artifacts.require("VotingContract");

module.exports = function (deployer) {
  // 후보자 목록을 배열로 정의
  const candidateNames = ["봉정근", "박상우", "민덕기"];

  // VotingContract 배포 - 후보자 목록 전달 (가스 한도 지정)
  deployer.deploy(VotingContract, candidateNames);
};
