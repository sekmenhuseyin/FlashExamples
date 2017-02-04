function make(f) {
var i;
var nreq;
var nopts;
nreq = f.rlist.length;
nopts =f.ocounts.length;
var ocountsa = new Array();
for (i=0; i<nopts;i++) {
 ocountsa[i]=f.ocounts[i].value;
}
var nreqc;
var ogrouptotal;
nreqc = 0;
for (i=0; i<nreq; i++) {
 if (f.rlist[i].checked) {
     nreqc++;   }
}
if (nreq == nreqc) {
  alert("You have taken all the required courses.")}
else {
  alert("You need to take "+parseInt(nreq-nreqc)+" more of the required courses.");}
var optiongroupname;
var j;
var coursesingroup;
var grouptotal;
for (i=0;i<nopts;i++) {

optiongroupname = "olist"+(i+1);

coursesingroup = document.getElementsByName(optiongroupname);
grouptotal=0;
for (j=0;j<coursesingroup.length;j++) {
 if (coursesingroup[j].checked) {
     grouptotal++;}
}
if (grouptotal>=ocountsa[i]) {
alert("You have satisfied option group "+(i+1));}
else {alert("You need to take " + parseInt(ocountsa[i]-grouptotal) +" in option group "+parseInt(i+1));}
}
}

