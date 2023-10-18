import { Routes, Route } from "react-router-dom"
import Homepage from './Homepage'
import Blog from './Blog'
import NotFound from './NotFound'

const Content = () => {
    const contentStyle = {
        backgroundColor: "#F7ebec",
        padding: "1rem",
        margin: "0 auto",
    }

    return (
        <div style={contentStyle}>
            <Routes>
                <Route path="/blog" element={<Blog />} />
                <Route path="/" element={<Homepage />} />
                <Route path="/home" element={<Homepage />} />
                <Route element={<NotFound />} />
            </Routes>
        </div>
    )
}

export default Content