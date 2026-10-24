import ERP from "./erp";
import {redirect} from "next/navigation";

export default async function Home({searchParams}:{searchParams:Promise<{code?:string;auth_code?:string;state?:string;app_key?:string}>}){
  const params=await searchParams;
  const code=params.code||params.auth_code;
  if(code&&params.state){
    const query=new URLSearchParams({code,state:params.state});
    if(params.app_key)query.set('app_key',params.app_key);
    redirect(`/api/tiktok/callback?${query}`);
  }
  return <ERP/>;
}
