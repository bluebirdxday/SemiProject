/* 전체 글자 수 count */
const countAll = document.querySelector('.admin_user_countAll');
const table = document.querySelector('.admin_user_table');
const tableCount = table.rows.length;

countAll.innerText = tableCount-1;


/* 강제 블락 */
const forcedBlock = document.getElementsByClassName('block');
const nameOfStates = document.querySelectorAll('.admin_user_states');

for(let i=0; i<forcedBlock.length;i++){

    forcedBlock[i].addEventListener('click',()=>{

    for(let j=i; j<=i;j++){
        if(nameOfStates[j].innerText != '블락'){
            forcedBlock[i].innerText = '블락해제';
            nameOfStates[j].innerText = '블락' ;

    }else if(nameOfStates[j].innerText == '블락');{
            forcedBlock[i].innerText == '회원블락';
           nameOfStates[j].innerText = '정상';   
    }
    
    }  

});
}

/* 체크박스 전체선택 */
function userSelectAll(userSelectAll)  {
    const checkboxes 
       = document.querySelectorAll('input[type="checkbox"]');
    
    checkboxes.forEach((checkbox) => {
      checkbox.checked = userSelectAll.checked
    })
  }