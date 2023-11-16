// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentSC {
    struct Student{
        uint roll;
        string  name;
        uint math;
        uint science;
        uint english;
    }

    Student [] public students;
    
    function createStudent(uint _roll, string memory _name,uint sub1, uint sub2,uint sub3) public {
        students.push(Student(_roll,_name,sub1,sub2,sub3));
    }

    function average(uint _index) public view returns(uint){
        require(_index<students.length,"does not exits");
        Student memory s = students[_index];
        uint total = ((s.math +s.science + s.english) / 3)*100;
        return(total);
    }


}
