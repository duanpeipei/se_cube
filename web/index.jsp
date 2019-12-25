<%--
  Created by IntelliJ IDEA.
  User: duanqifeng
  Date: 2019/11/20
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <title>Rubik's Cube Solver</title>
  <style>
    input {
      font-size: 16px;
      height: 26px;
    }
    .button {
        background-color: white;
        border: dimgray solid 2px;
        border-radius: 6px;
        color: black;
        padding: 3px 7px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        margin: 2px 0px;
        font-size: 16px;
        cursor: pointer;
        outline: none;
    }
    .disabled {
        opacity: 0.6;
        cursor: not-allowed;
        pointer-events: none;
    }
    .button:hover {
        box-shadow: 0 5px 6px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
    }
    .buttonset{
        background-color: black;
        color: white;
        border-radius: 3px;
        font-size: 12px;
        padding: 3px 3px;
        border: none;
    }
    .buttonu {
        width: 35px;
        height: 30px;
        background-color: white;
        color: black;
        border: gold solid 2px;
    }
    .buttonu:hover {
        background-color: gold;
        color: white;
    }
    .buttonr {
        width: 35px;
        height: 30px;
        background-color: white;
        color: black;
        border: orange solid 2px;
    }
    .buttonr:hover {
        background-color: orange;
        color: white;
    }
    .buttonf {
        width: 35px;
        height: 30px;
        background-color: white;
        color: black;
        border: darkolivegreen solid 2px;
    }
    .buttonf:hover {
        background-color: darkolivegreen;
        color: white;
    }
    .buttond {
        width: 35px;
        height: 30px;
        background-color: white;
        color: black;
        border: antiquewhite solid 2px;
    }
    .buttond:hover {
        background-color: antiquewhite;
    }
    .buttonl {
        width: 35px;
        height: 30px;
        background-color: white;
        color: black;
        border: red solid 2px;
    }
    .buttonl:hover {
        background-color: red;
        color: white;
    }
    .buttonb {
        width: 35px;
        height: 30px;
        background-color: white;
        color: black;
        border: lightskyblue solid 2px;
    }
    .buttonb:hover {
        background-color: lightskyblue;
        color: white;
    }
    .btns input {
      width: 42px;
      margin: 5px 0;
      padding: 0px;
    }
    .context-style::before{
      font-size: large;
      width: 20px;
      height: 20px;
      background: red;
    }
    .context-menu-hover {
      font-size: 30px;
    }
    .blue_style > span {
      background-color: lightskyblue;
      color: lightskyblue;
      width: 20px;
    }
    .yellow_style > span {
      background-color: gold;
      color: gold;
    }
    .white_style > span {
      background-color: antiquewhite;
      color: antiquewhite;
    }
    .green_style > span {
      background-color: darkolivegreen;
      color: darkolivegreen;
    }
    .orange_style > span {
      background-color: orange;
      color: orange;
    }
    .red_style > span {
      background-color: red;
      color: red;
    }
  </style>

  <!-- jquery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

</head>
<body style="background: #ffffff;">

<div style="width:100%; margin-top: 40px ;text-align: center">
    左键拖动魔方旋转
    <button id="initl" class="button buttonset">复位</button>
    <br>
    右键改变色块颜色
    <button id="reset" class="button buttonset">初始化</button>
</div>
<div id="mf" style="margin: 90px auto;background: #efefef"></div>

<div class="cs" id="cs" style="width:300px; margin:0 auto; text-align: center">
    <p style="font-size: 10px">以下按钮的颜色与每个面的中间方块颜色对应，第一行表示顺时针转动该面，第二行表示逆时针转动</p>
    <button name="turn" id="u" class="button buttonu">U</button>
    <button name="turn" id="r" class="button buttonr">R</button>
    <button name="turn" id="f" class="button buttonf">F</button>
    <button name="turn" id="d" class="button buttond">D</button>
    <button name="turn" id="l" class="button buttonl">L</button>
    <button name="turn" id="b" class="button buttonb">B</button>
    <br>
    <button name="turn" id="u'" class="button buttonu">U'</button>
    <button name="turn" id="r'" class="button buttonr">R'</button>
    <button name="turn" id="f'" class="button buttonf">F'</button>
    <button name="turn" id="d'" class="button buttond">D'</button>
    <button name="turn" id="l'" class="button buttonl">L'</button>
    <button name="turn" id="b'" class="button buttonb">B'</button>
    <br>
    <button name="turn" id="scramble" class="button" style="background-color: black; color: white; border: none">随机</button>
    <br>
    <p id="answer">打乱后点击“求解”显示步骤</p>
    <button id="solve" class="button">求解</button>
    <br>
    <button id="last" class="button">上一步</button>
    <button id="auto" class="button">开始</button>
    <button id="next" class="button">下一步</button>
</div>


<script type="text/javascript" src="./js/Cube.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script type="text/javascript">
    var cube = new Cube('mf', {borderLength: 200});

    var aInt2 = document.getElementById('cs').getElementsByTagName('button');
    document.getElementById('scramble').onclick = function () {
        cube.random();
    };

    var steps = [];//求解步骤，单个
    var steps_num = 0;//总步骤数
    var cur_step = 0;//当前在第几步

    recovery = function () {
        cube.getAndRefreshColor();
        var ip = "http://39.105.171.199:8080";
        var api = "/ucas/getSolve";
        var state = cube.state;
        var move;
        var data;
        axios.get(ip + api, {
            params: {
                state: state
            }
        })
            .then(function (value) {
                data = value.data.data;
                if (data != null && data.move != null && data.move !== "") {
                    move = value.data.data.move;
                    document.getElementById('answer').innerHTML = move;


                    temp_steps = move.split(" ");
                    var count = 0;
                    for (var  i=0;i<temp_steps.length;++i){
                        if (temp_steps[i].length<1){
                            continue;
                        } else {
                            steps[count] = temp_steps[i];
                            ++count
                        }
                    }
                    steps_num = count
                    cur_step = 0
                    // cube.recoveryTurn(move);
                } else {
                    window.alert("魔方不可解");
                }
            })
            .catch(function (reason) {
                window.alert(reason);
            });


    };

    var stop = null;

    document.getElementById('solve').onclick = function () {
        for (var btn in document.getElementsByName("turn")) {
            btn.disabled = true;
        }
        recovery(cube.state)
    };

    /*
    aInt2[2].onclick = function () {
        console.log(cube.state);
        var state = cube.getAndRefreshColor();
        document.getElementById('current-state').value = state;
    };
    */
    document.getElementById("auto").onclick = function() {
        if(document.getElementById('auto').innerHTML==="开始" && !stop) {
            document.getElementById('auto').innerHTML = "暂停";
            stop = setInterval(function (){
                if(cur_step<steps_num) {
                    document.getElementById('next').onclick();
                }else{
                    clearInterval(stop);
                    stop = null;
                    document.getElementById('auto').innerHTML = "开始";
                    document.getElementById('answer').innerHTML="打乱后点击“求解”显示步骤";
                }
            }, 700);
        }
        else if(document.getElementById('auto').innerHTML==="暂停" && stop) {
            document.getElementById('auto').innerHTML = "开始";
            clearInterval(stop);
            stop = null;
        }
    }



    document.getElementById("last").onclick = function () {
    //    上一步
        if(cur_step>0){
            //解步骤的逆操作
            if (steps[cur_step-1].length>1 && steps[cur_step-1][steps[cur_step-1].length-1]!=='\''){
                //d2 u2  操作+数字
                cube.turn3s(steps[cur_step-1][0].toLowerCase()+"'"+steps[cur_step-1][0].toLowerCase()+"'");
            }else {
                if (steps[cur_step-1].length>1){
                    //u'
                    cube.turn3(steps[cur_step-1][0].toLowerCase());
                } else {
                    //u
                    cube.turn3(steps[cur_step-1][0].toLowerCase()+"'");
                }
            }
            --cur_step;
        }else {
            alert("已经是初始状态")
        }
    };

    document.getElementById('next').onclick = function () {
      //    下一步
      if(cur_step<steps_num){

        if (steps[cur_step].length>1 && steps[cur_step][steps[cur_step].length-1]!=='\''){
          //d2 u2  操作+数字
          cube.turn3s(steps[cur_step][0].toLowerCase()+steps[cur_step][0].toLowerCase());
        }else {
          if (steps[cur_step].length>1){
            //u'
            cube.turn3(steps[cur_step][0].toLowerCase()+"'");
          } else {
            //u
            cube.turn3(steps[cur_step][0].toLowerCase());
          }
        }
        ++cur_step;
      }else {
          alert("所有步骤已完成");
          document.getElementById('auto').innerHTML="开始";
          document.getElementById('answer').innerHTML="打乱后点击“求解”显示步骤";
      }
    };

    document.getElementById('initl').onclick = function() {
      cube.initL();
    }
    document.getElementById('reset').onclick = function() {
        cube.initColor();
    }

    document.getElementById('u').onclick = function () {
      cube.turn3("u");
    }

    document.getElementById('r').onclick = function () {
      cube.turn3("r");
    }

    document.getElementById('f').onclick = function () {
      cube.turn3("f");
    }

    document.getElementById('d').onclick = function () {
      cube.turn3("d");
    }

    document.getElementById('l').onclick = function () {
      cube.turn3("l");
    }

    document.getElementById('b').onclick = function () {
      cube.turn3("b");
    }

    document.getElementById('u\'').onclick = function () {
      cube.turn3("u'");
    }

    document.getElementById('r\'').onclick = function () {
      cube.turn3("r'");
    }

    document.getElementById('f\'').onclick = function () {
      cube.turn3("f'");
    }

    document.getElementById('d\'').onclick = function () {
      cube.turn3("d'");
    }

    document.getElementById('l\'').onclick = function () {
      cube.turn3("l'");
    }

    document.getElementById('b\'').onclick = function () {
      cube.turn3("b'");
    }


    $(document).ready(function() {
        $.contextMenu({
            // define which elements trigger this menu
            selector: ".selecteColor",
            className: 'context-style',
            callback: function(key, options) {
                //var m = "clicked: " + options.$trigger.attr('id');
                adiv_CubeFace = document.getElementById(options.$trigger.attr('id'));

                adiv_CubeFace.style.background = key;

                cube.getAndRefreshColor();

            },
            // define the elements of the menu
            items: {
                lightskyblue: {name: "11111111", className: 'blue_style', },
                gold: {name: "22221111", className: 'yellow_style',},
                antiquewhite: {name: "33331111", className: 'white_style',},
                darkolivegreen: {name: "44441111", className: 'green_style',},
                orange: {name: "55551111", className: 'orange_style',},
                red: {name: "66661111", className: 'red_style',},
            }
            // there's more, have a look at the demos and docs...
        });

        $('.selecteColor').on('contextmenu', function(e){
            console.log(this.style.background);
        })

    });
</script>

</body>
</html>
