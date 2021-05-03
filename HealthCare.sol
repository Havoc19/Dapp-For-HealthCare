pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
contract HealthCare{
    address owner;
    constructor() public{
    owner = msg.sender;
    }
    struct patient{
        string []disease;
        string []medicine;
        uint timeStamp;
    }
    address []doctorArray;
    address []chemistArray;
    address []friendArray;
    mapping (address => patient) patientInfo;
    mapping (address => address) permissionedDoctor;
    mapping (address => address) permissionedFriend;
    mapping (address => address) permissionedChemist;
    mapping (address => mapping(address => patient)) linkedPDD;
    function getInfo(address _patientAddress) public view returns(string[] memory, string[] memory){
          if(msg.sender == owner || msg.sender == permissionedChemist[_patientAddress] || msg.sender == permissionedFriend[_patientAddress])
            return(patientInfo[_patientAddress].disease,patientInfo[_patientAddress].medicine);
    }
    function get_Recent_Doctor_Visited() public view returns(address){
        require(owner == msg.sender);
        return(doctorArray[doctorArray.length - 1]);
    }
    function doctors_VisitedTillNow() public view returns(address[] memory){
        require(owner == msg.sender);
        return(doctorArray);
    }
    function chemist_VisitedTillNow() public view returns(address[] memory){
        require(owner == msg.sender);
        return(chemistArray);
    }
    function getInfo_Set_By_Doctor(address _doctorAddress) public view returns(string[] memory, string[] memory){
        require(owner == msg.sender);
        return(linkedPDD[owner][_doctorAddress].disease,linkedPDD[owner][_doctorAddress].medicine);
    }
    function setInfo(address _patientAddress,address _doctorAddress,string memory disease,string memory medicine) public{
        if(permissionedDoctor[_patientAddress] == msg.sender){
        doctorArray.push(_doctorAddress);
        patientInfo[_patientAddress].disease.push(disease);
        linkedPDD[_patientAddress][_doctorAddress].disease.push(disease);
        patientInfo[_patientAddress].medicine.push(medicine);
        linkedPDD[_patientAddress][_doctorAddress].medicine.push(medicine);
        }
    }
    function getPatientAddress() public view returns(address){
        if(permissionedDoctor[owner] == msg.sender)
            return owner;
    }
    function set_View_For_Friend(address _patientAddress,address _viewAddress) public returns(string memory){
        require(owner == msg.sender);
        friendArray.push(msg.sender);
        permissionedFriend[_patientAddress] = _viewAddress;
    }
    function set_View_For_Chemist(address _patientAddress,address _viewAddress) public returns(string memory){
        require(owner == msg.sender);
        chemistArray.push(msg.sender);
        permissionedChemist[_patientAddress] = _viewAddress;
    }
    function setPermission(address _doctorAddress,address _patientAddress) public {
        require(msg.sender == owner);
        permissionedDoctor[_patientAddress] = _doctorAddress;
    }
    function revoke_For_Doctor() public{
        require(owner == msg.sender);
        delete permissionedDoctor[owner];
    }
    function revoke_For_Chemist() public{
        require(owner == msg.sender);
        delete permissionedChemist[owner];
    }
    function revoke_For_Friend() public{
        require(owner == msg.sender);
        delete permissionedFriend[owner];
    }
}
