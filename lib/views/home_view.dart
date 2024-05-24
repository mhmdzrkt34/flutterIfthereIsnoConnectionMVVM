import 'package:cleanarchitectureandrepopattern/model_views/home_model_view.dart';
import 'package:cleanarchitectureandrepopattern/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers: [

      ChangeNotifierProvider.value(value: GetIt.instance.get<HomeModelView>())
    ],
    
    child: Scaffold(

      appBar: AppBar(title:Text("Posts"),),
      body: postsSelector(),

    ),);


  
  }


  Selector<HomeModelView,Tuple2<List<PostModel>?,bool>> postsSelector(){


    return Selector<HomeModelView,Tuple2<List<PostModel>?,bool>>(selector: (context,provider)=>Tuple2(provider.posts, provider.catchgo),
    
    shouldRebuild: (previous,next)=>!identical(previous.item1, next.item1) || !identical(previous.item2,next.item2),

    builder: (context,value,child){

      return posts(value);

      



    },
    );
  }

  Widget posts(Tuple2<List<PostModel>?,bool> data){



    if(data.item2==true){


      return Center(child:
      
      GestureDetector(
        
        onTap: (){

          GetIt.instance.get<HomeModelView>().changeCathcGoToFalse();

          GetIt.instance.get<HomeModelView>().getPosts();


        },
        child:Text("problem on connection try again") ,)
       ,);
    }


    if(data.item1==null){


      return Center(child: CircularProgressIndicator(),);
    }

    return ListView.builder( itemCount: data.item1!.length,itemBuilder: (BuildContext context,int index){


      return Container(child: Text(data.item1![index].title),);
    }, );
  }

  
}