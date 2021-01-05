pragma solidity >= 0.7.0 <0.8.0 ;
pragma experimental ABIEncoderV2 ;
contract Attendance
{
    int[] rollno ;
    mapping(address => int) Adminl ;
    mapping(int => string) Student ;
    address owner ;
    
    constructor()
    {
        owner = msg.sender ;
        Adminl[msg.sender] = 1;
    }
    struct Student1
    {   
        int rollno ;
        string name ;
        int attendance ; 
    }
    
    mapping(int => Student1) students ;
  
    modifier onlyOwner
    {
        require(Adminl[msg.sender] == 1);
        _;
        
    }
    
    function addStudent(  int256 _rollno ,string  memory _name,int _attendance) public onlyOwner
    {
        students[ _rollno] = Student1(_rollno,_name,_attendance) ;
    }

    function viewAttendance(int _rollno ) view public returns(Student1 memory)
    {
        return students[_rollno];
    }
    
    
    function addAttendance(int _rollno) public onlyOwner
    {
        students[_rollno].attendance+=1 ;
    }
    
    
    function addAdmin(address adr) public onlyOwner
    {
            Adminl[adr] = 1 ;   
    }
}