console.log("Reply Module..............");

var replyService = (function(){

    // 댓글 등록
    function add(reply, callback, error){
        console.log("댓글 등록.........")

        $.ajax({
            type : 'post',
            url : 'replies/new',
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
                if(callback){
                    callback(result);
                }
            }, // end success
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            } // end error
        }) // end ajax
    } // end add


    // 댓글 목록
    function getList(reply, callback, error){
        var boardNo = param.boardNo;
        var page = param.page || 1;

        $.getJSON("/replies/pages/" + boardNo + "/" + page + ".json",
            function(data){
                if(callback){
                    // callback(data); // 댓글 목록만 가져오는 경우
                    callback(data.replyCnt, data.list); // 댓글 숫자와 목록을 가져오는 경우
                }
            }).fail(function(xhr, status, err){
                if(error){
                    error();
                }
            }); // end fail()
    } // end getList


    // 댓글 삭제
    function remove(replyNo, callback, error){
        $.ajax({
            type : 'delete',
            url : '/replies/' + replyNo,
            success : function(deleteResult, status, xhr){
                if(callback){
                    callback(deleteResult);
                }
            }, // end success
            error : function(xhr, status, er){
                if(error){
                    error();
                }
            } // end error
        });
    } // end remove


    // 댓글 수정
    function update(reply, callback, error){
        console.log("replyNo : " + reply.replyNo);

        $.ajax({
            type: 'put',
            url : '/replies/' + reply.replyNo,
            data : JSON.stringify(reply),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr){
                if(callback){
                    callback(result);
                }
            }, // end success
            error : function(xhr, status, er){
                if(error){
                    error(er);
                }
            } // end error
        }); // end ajax
    } // end update


    // 특정 댓글 조회
    function get(replyNo, callback, error){
        $.get("/replies/" + replyNo + ".json", function(result){
            if(callback){
                callback(result);
            }
        }).fail(function(xhr, status, err){
            if(error){
                error();
            }
        }).fail(function(xhr, status, err){
            if(error){
                error();
            }
        }) // end fail
    } // end get

    // 댓글 작성시간 처리
    function displayTime(timeValue){
        var today = new Date();
        var gap = today.getTime() - timeValue;

        var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000 * 60 * 60 * 24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return[
				(hh > 9 ?'' : '0') + hh, ':', 
				(mi > 9 ? '' : '0') + mi, ':',
				(ss > 9 ? '' : '0') + ss
				].join('');
				
		} else {
			var yy = dateObj.getFullYear();
			var mi = dateObj.getMonth() + 1; // getMonth()의 경우 0부터 시작하므로 1을 더해줘야함.
			var dd = dateObj.getDate();
			
			return[
				yy, '/', 
				(mm > 9 ? '' : '0') + mm, '/', 
				(dd > 9 ? '' : '0') + dd
			].join('');
		}
	};// end displayTime

    return {
        add : add,
        getList : getList,
        remove : remove,
        update : update,
        get : get,
        displayTime : displayTime
    };

})(); // replyService