let monthsEN = [
    "January"  ,
    "February" ,
    "March"    ,
    "April"    ,
    "May"      ,
    "June"     ,
    "July"     ,
    "August"   ,
    "September",
    "October"  ,
    "November" ,
    "December"
];

let monthsPL = [
    "Styczen"    ,
    "Luty"       ,
    "Marzec"     ,
    "Kwiecien"   ,
    "Maj"        ,
    "Czerwiec"   ,
    "Lipiec"     ,
    "Sierpien"   ,
    "Wrzesien"   ,
    "Pazdziernik",
    "Listopad"   ,
    "Grudzien"
];

let polishMode = false;
let months     = monthsEN;

function updateClock() {
  let now   = new Date();
  let milli = now.getMilliseconds();

  let sec = String(now.getSeconds()).padStart(2, '0');
  let min = String(now.getMinutes()).padStart(2, '0');
  let hou = String(now.getHours  ()).padStart(2, '0');
  
  let mo = now.getMonth   ();
  let dy = now.getDate    ();
  let yr = now.getFullYear();

  let tags = ["mon", "d", "y", "h", "m", "s", "mi"];
  let corr = [months[mo], dy, yr, hou, min, sec, milli];

  for (let i = 0; i < tags.length; i++)
    document.getElementById(tags[i]).innerHTML = corr[i];
}

function initClock() {
  updateClock();
  window.setInterval(updateClock, 1);
}

function changeLanguage() {
    if(polishMode)
        months = monthsEN;
    else
        months = monthsPL;

    polishMode = !polishMode;
}

initClock();