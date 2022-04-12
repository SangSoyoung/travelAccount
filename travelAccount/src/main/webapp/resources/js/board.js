console.log("Board Module..........");

var boardService = (function(){
	
	// 게시물 페이지 + 게시글 수(미완)
	function pageMaker(param, callback, error){
		var page = param.page || 1;
		
		$.getJSON("/reviewInfoBoards/pageMaker/pages/" + page + ".json",
		function(data){
			if (callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	} // end pageMaker
	
	
	// 게시물 목록
	function getList(param, callback, error){
		
		var page = param.page;
		
		$.getJSON("/reviewInfoBoards/boardList/pages/" + page + ".json",
		function(data){
			if (callback){
				//callback(data); // 댓글 목록만 가져오는 경우
				callback(data.boardCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	} // end getList
	
	
	// 게시물 등록시간 처리
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
				(hh > 9 ? '' : '0') + hh, ':',
				(mi > 9 ? '' : '0') + mi, ':',
				(ss > 9 ? '' : '0') + ss
			].join('');
			
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth()의 경우 0부터 시작하므로 1을 더해줘야함.
			var dd = dateObj.getDate();
			
			return[
				yy, '/',
				(mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd
			].join('');
		}
	}; // end displayTime


	// 게시물 검색
	function searchList(param, callback, error){
		
		var type = param.type;
		var keyword = param.keyword;
		var page = 1;
		// (param.page!=null)?param.page: 1
		
		$.getJSON("/reviewInfoBoards/boardList/pages/" + type + "/" + keyword + "/" + page + ".json",
		function(data){
			if (callback){
				//callback(data); // 댓글 목록만 가져오는 경우
				callback(data.boardCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	} // end searchList
	
	/*function get(param, callback, error){
		cosole.log("get board.............")
		
		var boardNo = param.boardNo;
		
		$.getJSON("/reviewInfoBoards/get/" + boardNo + ".json",
			function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if (error){
					error();
				}
			});
	}*/
	
	// 반환할 메서드 등록
	return {
		pageMaker : pageMaker,
		getList : getList,
		searchList : searchList,
		displayTime : displayTime,
			
	};
	
})();

